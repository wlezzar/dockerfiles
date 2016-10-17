REPO_BRANCH=${REPO_BRANCH:-"master"}
TARGET_DIR="/tmp/packages"
UNZIP=${UNZIP:-"true"}
TRUNCATE_VERSION=${TRUNCATE_VERSION:-"true"}

WHEREHOWS_TMP_DIR=/tmp/wherehows

# Download play
export PLAY_HOME="$HOME/play"
wget -O /tmp/play.zip http://downloads.typesafe.com/play/2.2.4/play-2.2.4.zip
unzip -d /tmp/play /tmp/play.zip
cp -R /tmp/play/play* $PLAY_HOME
sed -i -e 's/-Xss1M/-Xss2M/g' $PLAY_HOME/framework/build

# Buildig wherehows
git clone https://github.com/linkedin/WhereHows.git $WHEREHOWS_TMP_DIR
cd $WHEREHOWS_TMP_DIR
git checkout $REPO_BRANCH
./gradlew build && ./gradlew dist

# Copying the packages to target dir
if [[ ! -d "$TARGET_DIR" ]]; then
    mkdir -p $TARGET_DIR
fi

if [[ "$UNZIP" == "true" ]]; then
    unzip -d $TARGET_DIR $WHEREHOWS_TMP_DIR/web/target/universal/wherehows-1.0-SNAPSHOT.zip
    unzip -d $TARGET_DIR $WHEREHOWS_TMP_DIR/backend-service/target/universal/backend-service-1.0-SNAPSHOT.zip
    if [[ "$TRUNCATE_VERSION" == "true" ]]; then
        mv $TARGET_DIR/wherehows-* $TARGET_DIR/wherehows
        mv $TARGET_DIR/backend-service-* $TARGET_DIR/backend-service
    fi
else
    cp $WHEREHOWS_TMP_DIR/web/target/universal/wherehows-1.0-SNAPSHOT.zip $TARGET_DIR
    cp $WHEREHOWS_TMP_DIR/backend-service/target/universal/backend-service-1.0-SNAPSHOT.zip $TARGET_DIR
fi