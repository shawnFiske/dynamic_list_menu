package  
{
	import app.components.list.interfaces.IData;
	
	/**
	 * ...
	 * @author Shawn Fiske
	 */
	public class TestData implements IData 
	{
		private var _data:*;
		
		public function get data():* 
		{
			return _data;
		}
		
		public function set data(value:*):void 
		{
			_data = value;
		}
		
	}

}