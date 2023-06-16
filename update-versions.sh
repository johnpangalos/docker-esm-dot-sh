#/usr/bin/env sh

DATE=$(date '+%Y-%m-%d')
SHA=$(gh search commits -L 1 \
  -R esm-dev/esm.sh \
  --author-date="<=$DATE" \
  --json sha \
  -q ".[0].sha" \
  --sort author-date)

sed -i -e "s/ENV ESM_SH_COMMIT .*/ENV ESM_SH_COMMIT $SHA/" \
  ./edge/Dockerfile

# For some reason this chops off the table headers :shrug:
OUPUT=($(gh release -R esm-dev/esm.sh list -L 1))
VERSION=$(echo $OUPUT | sed 's/v//')

sed -i -e "s/value=v.*/value=v$VERSION.0.0/" \
  ./.github/workflows/docker-push-latest.yml

sed -i -e "s/ENV ESM_SH_VERSION.*/ENV ESM_SH_VERSION $VERSION/" \
  ./latest/Dockerfile
