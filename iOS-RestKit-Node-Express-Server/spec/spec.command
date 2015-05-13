
#!/bin/sh
dir=${0%/*}
if [ -d "$dir" ]; then
  cd "$dir"
fi

printf "\n"
printf "SPEC DIR: %s\n" $dir

printf "SERVER"
jasmine-node $dir/api/server-spec.js --captureExceptions
printf "SIGNIN"
jasmine-node $dir/api/signin-spec.js --captureExceptions
printf "CUSTOMERS"
jasmine-node $dir/api/customers-spec.js --captureExceptions
printf "CUSTOMERS"
jasmine-node $dir/api/orders-spec.js --captureExceptions