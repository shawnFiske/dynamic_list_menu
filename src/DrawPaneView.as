package  
{
	import app.components.list.interfaces.IData;
	import app.components.list.interfaces.IPane;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Shawn Fiske
	 */
	public class DrawPaneView extends Sprite implements IPane 
	{
		private var _view:Sprite;
		private var value:TextField;
		private var valForamat:TextFormat;
		private var _index:uint;
		private var _padding:Number;
		
		public function DrawPaneView() { 
			_view = drawBox();
			
			valForamat = new TextFormat(null, 12, 0x000000);
			value = new TextField();
			value.setTextFormat(valForamat);
			//value.x = 5;
			//value.y = 5;
			
			addChild(_view);
			addChild(value);
		}
		
		private function drawBox():Sprite 
		{
			var square:Sprite = new Sprite();
			addChild(square);
			square.graphics.lineStyle(1,0x808080);
			square.graphics.beginFill(0xFF0000);
			square.graphics.drawRect(0,0,100,60);
			square.graphics.endFill();
			
			return square;
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
			value.text = String(data.data);
		}
	}
}