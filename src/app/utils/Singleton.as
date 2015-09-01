package app.utils 
{
	public const Singleton:_Singleton = new _Singleton();
}

import flash.events.EventDispatcher;
import flash.utils.Dictionary;

internal class _Singleton extends EventDispatcher 
{
	private var dataDictionary:Dictionary = new Dictionary();
	
	public function _Singleton() { }
	
	public function getData():void {
		trace("get data");
	}
}  