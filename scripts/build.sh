#!/usr/bin/env bash
set -euo pipefail
tsc
mkdir -p dist/esm
cat >dist/cjs/package.json <<!EOF
{
    "type": "commonjs"
}
!EOF

cat >dist/esm/package.json <<!EOF
{
    "type": "module"
}
!EOF

cat >dist/esm/index.js <<!EOF
export * from "../cjs/index.js";
import mod from "../cjs/index.js";
export default mod['default'];
!EOF