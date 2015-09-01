package  
{
	import app.components.list.interfaces.IData;
	import app.components.list.interfaces.IPane;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Shawn Fiske
	 */
	public class RedPaneView extends Sprite implements IPane 
	{
		private var _view:RedPane;
		private var _index:uint;
		private var _padding:Number;
		
		public function RedPaneView() { 
			_view = new RedPane();
			addChild(_view);
		}
		
		public function get view():Sprite 
		{
			return _view;
		}
		
		public function get index():uint 
		{
			return _index;
		}
		
		public function set index(value:uint):void 
		{
			_index = value;
		}
		
		public function set padding(value:Number):void 
		{
			_padding = value;
		}
		
		public function get padding():Number 
		{
			return _padding;
		}
		
		public function paneData(data:IData):void
		{
			_view.value.text = data.data;
		}
	}
}