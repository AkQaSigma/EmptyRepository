from snowflake.snowpark.types import StructField, StructType, IntegerType, StringType
from snowflake.snowpark import Session

"""
You can create a Snowflake stored procedure from the 'create_dummy_table' function. You only need to follow these steps:
    1. Right-click on this file 
    2. Choose the '♦︎ Black Diamond: Export Python UDF' option. 
    3. A folder ('target') will be create with a new file inside of it called 'UDF-Export-Snowflake-Python.sql'
    3. Open 'UDF-Export-Snowflake-Python.sql' and replace the following fields in Step 3.1 to match your setup:
    		<stage-name>
    		<schema-name>
    		<procedure-name>
    		<procedure-parameters>
    		<procedure-return-type>
        (you can ignore or delete the section 3.2, since that part is used to export a User Defined Function)
    5. Right-click on 'UDF-Export-Snowflake-Python.sql' and choose "♦︎ Black Diamond: Deploy"
    6. Your stored procedure should be ready. You can call this stored procedure as you would normally do in Snowflake.
    7. Take into consideration that there are some limitations when creating Snowpark procedures or UDFs in Python.
"""
def create_dummy_table(sess: Session):
    id_column = StructField("id", IntegerType())
    value_column: StructField = StructField("value", StringType())
    structure = StructType([id_column, value_column])
    example_dataframe = sess.createDataFrame([(1, "one"), (2, "two")], structure).write.saveAsTable("example_dummy_table")
    return "Procedure Executed Successfully"