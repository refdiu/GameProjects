using System;

//MinValue/MaxValue: Shows size of dtype

namespace hell{
	public class hello{
		static void Main(string[] args){
			string a = Console.ReadLine();
			//int b= Convert.ToInt32(a);
			//Console.WriteLine(b > 18 ? "Adult":"Minor");
			if(int.TryParse(a, out int b)){
				Console.WriteLine(b);
			}
			else{
				Console.WriteLine("nigga");
			}
		}
	}
}
