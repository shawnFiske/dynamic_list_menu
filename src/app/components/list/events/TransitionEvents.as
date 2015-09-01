package app.components.list.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Shawn Fiske
	 */
	public class TransitionEvents extends Event 
	{
		public static const SCROLL_BEGIN:String = "scroll_begin";
		public static const SCROLL_FINISHED:String = "scroll_finish";
		
		public function TransitionEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new TransitionEvents(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("TransitionEvents", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}