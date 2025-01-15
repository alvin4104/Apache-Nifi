#!/bin/bash

# Xóa các tệp log cũ hơn 7 ngày
find /home/alvinnguyen41/nifi-1.28.1/logs/*.log -mtime +7 -exec rm -f {} \;

# Hoặc nén các tệp log thay vì xóa
find /home/alvinnguyen41/nifi-1.28.1/logs/*.log -mtime +7 -exec gzip {} \;

echo "Log files cleaned up successfully."
