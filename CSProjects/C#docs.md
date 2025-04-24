# C# docs

- Decimal is also a datatype
- need to initialize or assign a floating point value by adding literal, also called suffix in the end.
+ MinValue, MaxValue shows the lowest/highest value of dtype
+ whenever we declare string type variables:
	* string : "";
	* char : '\0'; //(escape character)
- Convert.ToInt32(), Convert.ToInt64(), Convert.ToDouble(), Convert.ToSingle() (Forfloat), Convert.ToDecimal()
- adding two characters actually adds their unicode values
- var; implicit declaration of variable; assigns dtype based on value
- const keyword used for storing constants; default access specifier is local
- ternary operator ? used to simplify if statements
	+ > Eg. string result = age >= 18 ? "Adult":"Minor"
- string functions and numeric formatting
	+ string.Format("{index}", value)
		* string.Format("{index:number of decimal places rounded off to}")
		* string.Format("{index:0.# /* removes trailing zeroes */}")
- try-parse function: Converts the string representation of a number to its 32-bit signed integer equivalent. Used to go over the format exception when converting string to integer. Rather, parses the number to be found out in a string.
- verbatim string literal: @
- string formatting, same as numeric formatting
- string interpolation: $, same as using f in python
- string operations
	- string.Concat(, ,)
	- string v == string.Empty: checks if v is an empty string or not
	- string_var.Equals("string to compare") compares memory reference
	- System.Threading contains Thread.Sleep(s) s--> milliseconds.
	- string_var.Contains(); checks for substring in a string
	- string_var.Length
	- string.IsNullOrEmpty(string_var)
	- string_var.Replace()
- foreach(dtype varname in arrayname)
- Array operations:
	- Array.Sort()
	- Array.Reverse()
	- Array.Clear()
	- Array.IndexOf(array, val)