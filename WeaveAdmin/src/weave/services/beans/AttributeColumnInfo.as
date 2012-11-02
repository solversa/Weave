/*
    Weave (Web-based Analysis and Visualization Environment)
    Copyright (C) 2008-2011 University of Massachusetts Lowell

    This file is a part of Weave.

    Weave is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License, Version 3,
    as published by the Free Software Foundation.

    Weave is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Weave.  If not, see <http://www.gnu.org/licenses/>.
*/

package weave.services.beans
{
	import mx.rpc.events.ResultEvent;

	public class AttributeColumnInfo extends EntityMetadata
	{
		public var id:int;
		public var entity_type:int;
		
		public function AttributeColumnInfo()
		{
			id = -1;
			entity_type = -1;
		}
		
		public function getAllMetadata():Object
		{
			return mergeObjects(privateMetadata, publicMetadata);
		}
		public function isCategory():Boolean
		{
			return this.entity_type == ENTITY_CATEGORY;
		}
		public function isColumn():Boolean
		{
			return this.entity_type == ENTITY_COLUMN;
		}
		public function isDataTable():Boolean
		{
			return this.entity_type == ENTITY_TABLE;
		}
		
		public static const CONNECTION:String = "connection";
		public static const SQLQUERY:String = "sqlQuery";
		public static const SQLPARAMS:String = "sqlParams";
		public static const SQLRESULT:String = "sqlResult";
		public static const SCHEMA:String = "schema";
		public static const TABLEPREFIX:String = "tablePrefix";
		public static const IMPORTNOTES:String = "importNotes";
		public static function isPrivate(prop:String):Boolean
		{
		    return prop in [CONNECTION, SQLQUERY, SQLPARAMS, SQLRESULT, SCHEMA, TABLEPREFIX, IMPORTNOTES];
		}
		public static const ENTITY_TABLE:int = 0;
		public static const ENTITY_COLUMN:int = 1;
		public static const ENTITY_CATEGORY:int = 2;
		
		public static function getEntityIdFromResult(result:Object):int
		{
			return result.id;
		}
		
		public function copyFromResult(result:Object):void
		{
			this.id = getEntityIdFromResult(result);
			this.entity_type = result.type;
			this.privateMetadata = result.privateMetadata || {};
			this.publicMetadata = result.publicMetadata || {};
	
			// replace nulls with empty strings
			var name:String;
			for (name in this.privateMetadata)
				if (this.privateMetadata[name] == null)
					this.privateMetadata[name] = '';
			for (name in this.publicMetadata)
				if (this.publicMetadata[name] == null)
					this.publicMetadata[name] = '';
		}
		
		public static function mergeObjects(a:Object, b:Object):Object
		{
		    var result:Object = {}
		    for each (var obj:Object in [a, b])
				for (var property:Object in obj)
				    result[property] = obj[property];
		    return result;
		}
		public static function diffObjects(old:Object, fresh:Object):Object
		{
		    var diff:Object = {};
		    for (var property:String in mergeObjects(old, fresh))
				if (old[property] != fresh[property])
				    diff[property] = fresh[property];
		    return diff;
		}
	}
}
