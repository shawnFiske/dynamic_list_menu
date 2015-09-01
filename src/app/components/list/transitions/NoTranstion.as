package app.components.list.transitions 
{
	import a24.tween.Tween24;
	import app.components.list.events.TransitionEvents;
	import app.components.list.interfaces.IPane;
	import app.components.list.interfaces.ITransition;
	import app.components.list.ScrollView;
	import flash.events.EventDispatcher;

	public class NoTranstion implements ITransition
	{
		private const SCROLL_VERTICAL:uint = 0;
		private const SCROLL_HORIZONTAL:uint = 1;
		
		private var _scrollType:uint = SCROLL_VERTICAL;
		
		private var _transitionInItem:IPane;
		private var _transtionOutItem:IPane;
		
		private var _engine:ScrollView;
		
		public function play(item:IPane):void
		{
			if (_scrollType == SCROLL_VERTICAL)
			{
				item.view.y = (item.index * item.view.height) + (item.padding * item.index);
			}else {
				item.view.x = (item.index * item.view.width) + (item.padding * item.index);
			}
		}
		
		public function playIn(item:IPane):void
		{
			_transitionInItem = item;

			if (_scrollType == SCROLL_VERTICAL)
			{
				item.view.y = (item.index * item.view.height) + (item.padding * item.index);
			}else {
				item.view.x = (item.index * item.view.width) + (item.padding * item.index);
			}
		}
		
		public function playOut(item:IPane):void
		{
			_transtionOutItem = item;
			Tween24.tween(item.view, 0.01).andRemoveChild().play();
		}
		
		public function set scrollType(value:uint):void 
		{
			_scrollType = value;
		}
		
		public function set engine(value:ScrollView):void 
		{
			_engine = value;
		}
	}
}