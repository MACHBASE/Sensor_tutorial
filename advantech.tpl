###############################################################################
# Copyright of this product 2013-2023,
# MACHBASE Corporation(Incorporation) or its subsidiaries.
# All Rights reserved
###############################################################################

#
#  This is a template file for collector.
#

###################################################################
# Collect setting
###################################################################

COLLECT_TYPE=FILE

LOG_SOURCE="C:\Machbase\machcollector_home\collector\advantech\(([0-9]+)-([0-9]+)-([0-9]+))_(([0-9]+)-([0-9]+)-([0-9]+))@([0-9]+).log"

###################################################################
# Process setting
###################################################################

REGEX_PATH=advantech.rgx

###################################################################
# Output setting
###################################################################

DB_TABLE_NAME = "advantech_table"
DB_ADDR       = "127.0.0.1"
DB_PORT       = 5656
DB_USER       = "SYS"
DB_PASS       = "MANAGER"

# 0 : none, just append
# 1 : truncate
# 2 : try to create table. if table already exists, warn it and proceed.
# 3 : drop and create
CREATE_TABLE_MODE=2

