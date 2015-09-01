package 
{
	import app.components.list.interfaces.IData;
	import GrayPaneView;
	import RedPaneView;
	import app.components.list.transitions.LinearTransition;
	import app.components.list.transitions.NoTranstion;
	import app.components.list.transitions.TopLeftTransition;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;

	//import app.layout.MainHud;
	//import app.layout.ScalingConstants;
	//import app.layout.PositionConstants;

	import app.components.list.ScrollView;
	
	public class Main extends Sprite 
	{
		private var greyView:ScrollView;
		private var redView:ScrollView;
		
		private var data:Vector.<IData> = new Vector.<IData>;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			buildGrayMenu();
			buildRedMenu();
		}
		
		private function buildGrayMenu():void
		{
			greyView = new ScrollView(genData(), 6);
			greyView.x = 80;
			greyView.y = 80;
			greyView.panePadding = 5;
			
			greyView.scrolltype = greyView.SCROLL_HORIZONTAL;
			greyView.transitonClass = new NoTranstion();
			greyView.setTopOrLeftThumb(new TopThumb());
			greyView.setBottomOrRightThumb(new BottomThumb());

			greyView.buildView(GrayPaneView);
			addChild(greyView);
		}
		
		private function buildRedMenu():void
		{
			redView = new ScrollView(genData(), 4);
			redView.scaleX = redView.scaleY = 1;
			redView.x = 280;
			redView.y = 220;
			
			redView.panePadding = 2;
			redView.scrolltype = redView.SCROLL_VERTICAL;
			
			redView.transitonClass = new LinearTransition();
			
			redView.setTopOrLeftThumb(new TopThumb());
			redView.setBottomOrRightThumb(new BottomThumb());

			redView.buildView(DrawPaneView);
			addChild(redView);
		}
		
		private function genData():Vector.<IData>
		{
			for (var i:uint = 0; i < 30; ++i)
			{
				var temp:TestData = new TestData();
				temp.data = i+1;
				
				data.push(temp)
			}
			
			return data;
		}
		
	}
	
}