package app.utils 
{

	public class Singleton2
	{
        private static var instance:Singleton2 = new Singleton2();
        public var flexData:String = "SuperApp";
		public var userScore:int = 0;
 
       	public function Singleton2()
		{
			if(instance)
			{
				throw new Error ("We cannot create a new instance.Please use Singleton2.getInstance()");
			}
		}
 
		public static function getInstance():Singleton2
		{
			return instance;
		}
		
		public static function getData():void {
			trace("get data");
		}
	}

}