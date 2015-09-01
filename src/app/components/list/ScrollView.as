package app.components.list 
{
	import app.components.list.events.TransitionEvents;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import app.components.list.interfaces.IPane;
	import app.components.list.interfaces.ITransition;
	import app.components.list.interfaces.IData;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ScrollView extends Sprite
	{
		public const SCROLL_VERTICAL:uint = 0;
		public const SCROLL_HORIZONTAL:uint = 1;
		
		public const TRANSITON_DIRECTION_NORMAL:uint = 0;
		public const TRANSITON_DIRECTION_TOP_OR_RIGHT:uint = 1;
		public const TRANSITON_DIRECTION_BOTTOM_OR_LEFT:uint = 2;
		
		private var _mask:Sprite;
		
		private var _panePadding:Number = 0;
		private var _data:Vector.<IData>;
		private var _numVisible:uint = 4;
		private var _scrolltype:uint = SCROLL_VERTICAL;
		private	var _transitionType:uint = TRANSITON_DIRECTION_NORMAL;
		
		private var _transitonClass:ITransition;
		
		private var top_left_thumb:DisplayObject;
		private var bottom_right_thumb:DisplayObject;
		
		private var paneListVector:Vector.<IPane>;
		private var viewListVector:Vector.<IPane>;
		
		private var _pointer:uint = 0;
		private var viewPane:IPane;
		private var _destroyPane:IPane;
		
		public function ScrollView(data:Vector.<IData>, numVisible:uint = 4) 
		{
			_data = data;
			_numVisible = numVisible;
		}
		
		public function buildView(ViewPane:Class):void 
		{
			paneListVector = new Vector.<IPane>;
			viewListVector = new Vector.<IPane>;
			
			_transitonClass.scrollType = _scrolltype;
			
			for (var index:uint = 0; index < _data.length; ++index) {
				viewPane = new ViewPane();
				viewPane.index = index;
				viewPane.padding = _panePadding;
				viewPane.paneData(_data[index]);

				//initial postions
				//TODO:add in support for variable sized viewPanes 
				if (_scrolltype == SCROLL_VERTICAL)
				{
					viewPane.view.y = (viewPane.index * viewPane.view.height) + (viewPane.padding * viewPane.index)
				}else {
					viewPane.view.x = (viewPane.index * viewPane.view.width) + (viewPane.padding * viewPane.index)
				}
			
				if (index < _numVisible)
				{
					addChild(viewPane.view);
					viewListVector.push(viewPane);
				}
				
				paneListVector.push(viewPane);
			}
			
			placeScrollers();
			scrollPanes();
		}
		
		public function addPane(ViewPane:Class, data:IData):void
		{
			viewPane = new ViewPane();
			viewPane.index = paneListVector.length;
			viewPane.padding = _panePadding;
			viewPane.paneData(data);
			
			paneListVector.push(viewPane);
		}
		
		private function placeScrollers():void 
		{
			if (_scrolltype == SCROLL_VERTICAL)
			{
				top_left_thumb.x = viewWidth() / 2;
				top_left_thumb.y = 0 - _panePadding;
				bottom_right_thumb.x = viewWidth() / 2;
				bottom_right_thumb.y = viewHeight() + _panePadding;
			}
			
			if (_scrolltype == SCROLL_HORIZONTAL)
			{
				top_left_thumb.x = 0 - _panePadding;
				top_left_thumb.y = viewHeight() / 2;
				top_left_thumb.rotation = -90;
				
				bottom_right_thumb.x =  viewWidth() + _panePadding;
				bottom_right_thumb.y = viewHeight() / 2;
				bottom_right_thumb.rotation = -90;
			}
			
			top_left_thumb.addEventListener(MouseEvent.CLICK, onPanBottomRight, false, 0, true);
			bottom_right_thumb.addEventListener(MouseEvent.CLICK, onPanTopLeft, false, 0, true);
			top_left_thumb.visible = false;
			
			addChild(bottom_right_thumb);
			addChild(top_left_thumb);
		}
		
		private function onPanTopLeft(e:MouseEvent):void 
		{
			bottom_right_thumb.visible = true;
			top_left_thumb.visible = true;
			
			if (_pointer + (_numVisible - 1) < paneListVector.length - 1)
			{
				_pointer++;
				var _lastPointer:uint = _pointer + (_numVisible - 1);
				_destroyPane = viewListVector.shift();
				
				setIndexValues();
				_transitonClass.playOut(_destroyPane);
				
				for (var index:uint = 0; index < viewListVector.length; ++index ) 
				{
					_transitonClass.play(viewListVector[index]);
				}
				
				var addPane:IPane = paneListVector[_lastPointer];
				viewListVector.push(addPane);
				addChild(addPane.view);
				
				setIndexValues();
				_transitonClass.playOut(_destroyPane);
				_transitonClass.playIn(addPane);
				
				
				//scrollPanes();
				if (_pointer + (_numVisible - 1) == paneListVector.length - 1)
				{
					bottom_right_thumb.visible = false;
				}
			}else {
				bottom_right_thumb.visible = false;
			}
		}
		
		private function onPanBottomRight(e:MouseEvent):void 
		{
			bottom_right_thumb.visible = true;
			top_left_thumb.visible = true;
			
			if (_pointer > 0)
			{
				top_left_thumb.visible = true;
				_pointer--;
				_destroyPane = viewListVector.pop();
				
				setIndexValues();
				_transitonClass.playOut(_destroyPane);
				
				var addPane:IPane = paneListVector[_pointer];
				viewListVector.unshift(addPane);
				addChild(addPane.view);

				setIndexValues();
				_transitonClass.playIn(addPane);
				
				for (var index:uint = 0; index < viewListVector.length; ++index ) 
				{
					_transitonClass.play(viewListVector[index]);
				}
				
				//scrollPanes();
				if (_pointer == 0)
				{
					top_left_thumb.visible = false;
				}
			}else {
				top_left_thumb.visible = false;
			}
		}
		
		private function scrollPanes():void 
		{
			if (_scrolltype == SCROLL_VERTICAL)
			{
				postionPanesY();
			}else {
				postionPanesX();
			}
		}
		
		private function postionPanesY(e:Event = null):void 
		{
			for (var index:uint = 0; index < _numVisible; ++index ) 
			{
				var newView:IPane = viewListVector[index];
			}
		}
		
		private function postionPanesX():void 
		{
			for (var index:uint = 0; index < _numVisible; ++index ) 
			{
				var newView:IPane = viewListVector[index];
			}
		}
		
		private function setIndexValues():void 
		{
			for (var index:uint = 0; index < viewListVector.length; ++index) 
			{
				viewListVector[index].index = index;
			}
		}
		
		public function get panePadding():Number 
		{
			return _panePadding;
		}
		
		public function set panePadding(value:Number):void 
		{
			_panePadding = value;
		}
		
		public function set scrolltype(value:uint):void 
		{
			_scrolltype = value;
		}
		
		public function set transitonClass(value:ITransition):void 
		{
			_transitonClass = value;
			_transitonClass.engine = this;
		}
		
		public function setTopOrLeftThumb(thumb:DisplayObject, rotate:Boolean = false):void
		{
			top_left_thumb = thumb;
		}
		
		public function setBottomOrRightThumb(thumb:DisplayObject, rotate:Boolean = false):void
		{
			bottom_right_thumb = thumb;
		}
		
		//calculate viewable width
		private function viewWidth():Number
		{
			if (_scrolltype == SCROLL_VERTICAL)
			{
				return paneListVector[0].view.width;
			}
			
			if (_scrolltype == SCROLL_HORIZONTAL)
			{
				return (_numVisible * paneListVector[0].view.width) + ((_numVisible-1) * _panePadding);
			}
			
			return 0;
		}
		
		//calculate viewable height
		private function viewHeight():Number
		{
			if (_scrolltype == SCROLL_VERTICAL)
			{
				return (_numVisible * paneListVector[0].view.height) + ((_numVisible-1) * _panePadding);
			}
			
			if (_scrolltype == SCROLL_HORIZONTAL)
			{
				return paneListVector[0].view.height;
			}
			
			return 0;
		}
	}
}