import os
from snowflake.snowpark import Session
from snowflake.snowpark.functions import call_builtin, call_udf, col, lit

# If you just want to use Python (without Snowpark) you can start with the following line of code
print('Hello World!')

# If you want to use Snowpark, you can use this code to build a connection and run a basic query
# This session is configured to use the current active connection (which you can modify using the SQL Tools extension)
connection_parameters = {
	"account": os.environ["SNOW_ACCOUNT"],
	"user": os.environ["SNOW_USER"],
	"password": os.environ["SNOW_PASSWORD"],
	"role": os.environ["SNOW_ROLE"],
	"warehouse": os.environ["SNOW_WAREHOUSE"],
	"database": os.environ["SNOW_DATABASE"],
	"schema": os.environ.get("SNOW_SCHEMA")
}
session = Session.builder.configs(connection_parameters).create()
session.sql("SELECT 'Hello World!'").show()
session.close()