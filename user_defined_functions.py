"""
You can create a Snowflake UDF (User Defined Function) from the 'simple_division' function. You only need to follow these steps:
	1. Right-click on this file 
    2. Choose the '♦︎ Black Diamond: Export Python UDF' option. 
    3. A folder ('target') will be create with a new file inside of it called 'UDF-Export-Snowflake-Python.sql'
    4. Open 'UDF-Export-Snowflake-Python.sql' and replace the following fields in Step 3.2 to match your setup:
    		<stage-name>
    		<schema-name>
    		<function-name>
    		<function-parameters>
    		<function-return-type>
        (you can ignore or delete the section 3.1, since that part is used to export a procedure)
    5. Right-click on 'UDF-Export-Snowflake-Python.sql' and choose "♦︎ Black Diamond: Deploy"
	6. Your funcion should be ready. You can perform queries using this UDF as you would normally do in Snowflake.
	7. Take into consideration that there are some limitations when creating Snowpark procedures or UDFs in Python.
"""
def simple_division(a: float, b: float):
    return a / b