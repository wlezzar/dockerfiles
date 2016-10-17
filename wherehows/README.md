## Package wherehows
```bash
docker run -it --rm -v $TARGET_DIR:/tmp/packages -v $(pwd)/wherehows/package-wherehows.sh:/package-wherehows.sh openjdk:8 /bin/bash -c /package-wherehows.sh
cp -R $TARGET_DIR/wherehows front
cp -R $TARGET_DIR/backend-service backend
```