package app.components.list.interfaces 
{
	import flash.display.Sprite;
	import app.components.list.interfaces.IData;
	
	public interface IPane 
	{
		function get view():Sprite;
		function paneData(data:IData):void;
		function get index():uint; 
		function set index(value:uint):void;
		function set padding(value:Number):void;
		function get padding():Number;
	}
}