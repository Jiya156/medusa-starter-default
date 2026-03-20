#!/bin/sh
cd /server/.medusa/server && yarn install
npx medusa db:migrate
exec npx medusa start