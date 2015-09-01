package app.components.list.transitions 
{
	import a24.tween.Tween24;
	import app.components.list.events.TransitionEvents;
	import app.components.list.interfaces.IPane;
	import app.components.list.interfaces.ITransition;
	import app.components.list.ScrollView;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;

	public class TopLeftTransition implements ITransition
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
				item.view.x = 0;
				Tween24.tween(item.view, 0.3).y((item.index * item.view.height) + (item.padding * item.index)).play();
			}else {
				item.view.y = 0;
				Tween24.tween(item.view, 0.3).x((item.index * item.view.width) + (item.padding * item.index)).play();
			}
		}
		
		public function playIn(item:IPane):void
		{
			_transitionInItem = item;
			
			item.view.alpha = 0;
			
			if (_scrollType == SCROLL_VERTICAL)
			{
				item.view.y = (item.index * item.view.height) + (item.padding * item.index);
				item.view.x = item.view.x + item.view.width + item.padding;
				
				Tween24.serial(
					Tween24.wait(0.3),
					Tween24.parallel(
						Tween24.tween(item.view, 0.5).alpha(1),
						Tween24.tween(item.view, 0.5).x(0)
					).play()
				).play();
			}else {
				item.view.x = (item.index * item.view.width) + (item.padding * item.index);
				item.view.y = item.view.y - item.view.height + item.padding;
				
				Tween24.serial(
					Tween24.wait(0.3),
					Tween24.parallel(
						Tween24.tween(item.view, 0.5).alpha(1),
						Tween24.tween(item.view, 0.5).y(0)
					).play()
				).play();
			
				
			}
		}
		
		public function playOut(item:IPane):void
		{
			_transtionOutItem = item;
			Tween24.tween(item.view, 0.01).andRemoveChild().play();
		}
	/*	
		public function playOut(item:IPane):void
		{
			_transtionOutItem = item;
			
			if (_scrollType == SCROLL_VERTICAL)
			{
				Tween24.parallel(
					Tween24.tween(item.view, 0.2).alpha(0),
					Tween24.tween(item.view, 0.2).x(item.view.x + item.view.width + item.padding)
				).play();
			}else {
				Tween24.parallel(
					Tween24.tween(item.view, 0.2).alpha(0),
					Tween24.tween(item.view, 0.2).y(item.view.y - item.view.height + item.padding)
				).play();
			}
		}*/
		
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