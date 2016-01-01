/* ***** BEGIN LICENSE BLOCK *****
 *
 * This file is part of Weave.
 *
 * The Initial Developer of Weave is the Institute for Visualization
 * and Perception Research at the University of Massachusetts Lowell.
 * Portions created by the Initial Developer are Copyright (C) 2008-2015
 * the Initial Developer. All Rights Reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this file,
 * You can obtain one at http://mozilla.org/MPL/2.0/.
 * 
 * ***** END LICENSE BLOCK ***** */

package weavejs.api.net
{
	import weavejs.util.WeavePromise;

	/**
	 * An interface for GET and POST URL requests.
	 * 
	 * @author adufilie
	 */
	public interface IURLRequestUtils
	{
		/**
		 * Makes a URL request.
		 * @param method Either "get" or "post"
		 * @param url The URL
		 * @param requestHeaders Maps request header names to values
		 * @param data Specified if method is "post"
		 * @param responseType Can be "text", "arraybuffer", "blob", "json", or "document"
		 * @return A WeavePromise
		 */
		function request(relevantContext:Object, method:String, url:String, requestHeaders:Object, data:String, responseType:String):WeavePromise;
	}
}