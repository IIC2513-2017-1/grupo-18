/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */


CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
  config.toolbar = [
['Undo', 'Redo', '-',  'RemoveFormat',
'-','Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript',
'-','NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote',
'-','JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock',
'-','Link', 'Unlink',
'-','Table', 'HorizontalRule', 'PageBreak',
'-','Styles', 'Format', 'Font', 'FontSize',
'-','TextColor', 'BGColor',
'-','abbr', 'inserthtml4x'] ]
config.toolbar = 'article';

  config.toolbar_article = [
['Undo', 'Redo', '-',  'RemoveFormat',
'-','Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript', 'Superscript',
'-','NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote',
'-','JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock',
'-','Link', 'Unlink',
'-','Table', 'HorizontalRule', 'PageBreak',
'-','Styles', 'Format', 'Font', 'FontSize',
'-','TextColor', 'BGColor',
'-','abbr', 'inserthtml4x'] ]


};
