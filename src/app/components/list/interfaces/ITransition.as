package app.components.list.interfaces 
{
	import app.components.list.ScrollView;
	/**
	 * ...
	 * @author Shawn Fiske
	 */
	public interface ITransition 
	{
		function play(item:IPane):void;
		function playIn(item:IPane):void;
		function playOut(item:IPane):void;
		function set scrollType(value:uint):void;
		function set engine(value:ScrollView):void 
	}
}