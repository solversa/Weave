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

package weavejs.api.ui
{
	import weavejs.api.core.ILinkableObject;

	/**
	 * Manages implementations of ILinkableObjectEditor.
	 */
	public interface IEditorManager extends ILinkableObject
	{
		/**
		 * Sets a human-readable label for an ILinkableObject to be used in editors.
		 */
		function setLabel(object:ILinkableObject, label:String):void;
		
		/**
		 * Gets the previously-stored human-readable label for an ILinkableObject.
		 */
		function getLabel(object:ILinkableObject):String;
	}
}
