/* ----------------------------------------------------------------------------

	Copyright (c) GeoWorks 1992 -- All Rights Reserved

PROJECT:	PC/GEOS
FILE:		geoworks.h

REVISION HISTORY:
	Name	Date		Description
	----	----		-----------
	doug	1/92		Initial version

DESCRIPTION:

	Certain mechanisms within PC/GEOS utilize a two-word indentification
	scheme in which the first word is a ManufacturerID, & the second
	is an enumeration defined by the manufacturer identified by the
	first word.  This file contains the enumerations for Geoworks's
	own ManufacturerID of MANUFACTURER_ID_GEOWORKS.
	
	NOTE:  Any developer assigned a ManufacturerID should have a file
	       similar to this one, named after their own company, for the
	       purpose of defining the meaning of enumerations when that
	       ManufacturerID is used.

	WARNING:
	       When updating this file, it is imperative that the assemmbly
	       equivalent, Include/geoworks.def, be updated as well.

	ONE MORE THING:
	       NOTHING should be placed in this file that can be made to
	       reside in a more specialized include file.  Yes, that includes
	       Notification data block structures!  This is not a substitute
	       for a library-specific definition file;  Constants & structures
	       pertinent to a specific library belong in a specific include
	       file for that library.
	       
	$Id: geoworks.h,v 1.1 97/04/04 15:57:07 newdeal Exp $

----------------------------------------------------------------------------*/

#ifndef	__GEOWORKS
#define __GEOWORKS

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	MSG_META_NOTIFY & MSG_META_NOTIFY_WITH_DATA_BLOCK NotificationTypes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	MSG_META_NOTIFY & MSG_META_NOTIFY_WITH_DATA_BLOCK are general purpose
	notification messages, whose data format & meaning are defined by
	the "NotificationType" passed in the messages.

	This section contains the enumerations of the NT_type field of
	NotificationType for the case of NT_manuf = MANUFACTURER_ID_GEOWORKS.

	Name	Date		Description
	----	----		-----------
	doug	1/92		Initial version

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

typedef enum /* word */ {
    GWNT_INK,

    GWNT_GEN_CONTROL_NOTIFY_STATUS_CHANGE,

    GWNT_SELECT_STATE_CHANGE,
    GWNT_UNDO_STATE_CHANGE,    

    GWNT_STYLE_CHANGE,
    GWNT_STYLE_SHEET_CHANGE,

    GWNT_TEXT_CHAR_ATTR_CHANGE,
    GWNT_TEXT_PARA_ATTR_CHANGE,
    GWNT_TEXT_TYPE_CHANGE,
    GWNT_TEXT_SELECTION_CHANGE,
    GWNT_TEXT_COUNT_CHANGE,

    GWNT_TEXT_STYLE_CHANGE,
    GWNT_FONT_CHANGE,
    GWNT_POINT_SIZE_CHANGE,
    GWNT_FONT_ATTR_CHANGE,
    GWNT_JUSTIFICATION_CHANGE,
    GWNT_TEXT_FG_COLOR_CHANGE,
    GWNT_TEXT_BG_COLOR_CHANGE,
    GWNT_TEXT_PARA_COLOR_CHANGE,
    GWNT_TEXT_BORDER_COLOR_CHANGE,

    GWNT_SEARCH_REPLACE_ENABLE_CHANGE,
    GWNT_SPELL_ENABLE_CHANGE,

    GWNT_CHART_TYPE_CHANGE,
    GWNT_CHART_GROUP_FLAGS,
    GWNT_CHART_AXIS_ATTRIBUTES,

    GWNT_GROBJ_CURRENT_TOOL_CHANGE,
    GWNT_GROBJ_BODY_SELECTION_STATE_CHANGE,
    GWNT_GROBJ_AREA_ATTR_CHANGE,
    GWNT_GROBJ_LINE_ATTR_CHANGE,
    GWNT_GROBJ_TEXT_ATTR_CHANGE,
    GWNT_GROBJ_BODY_INSTRUCTION_FLAGS_CHANGE,
    GWNT_GROBJ_GRADIENT_ATTR_CHANGE,

    GWNT_RULER_TYPE_CHANGE,
    GWNT_RULER_GRID_CHANGE,
    GWNT_RULER_GUIDE_CHANGE,

    GWNT_BITMAP_CURRENT_TOOL_CHANGE,
    GWNT_BITMAP_CURRNET_FORMAT_CHANGE,

    GWNT_FLAT_FILE_FIELD_PROPERTIES_STATUS_CHANGE,
    GWNT_FLAT_FILE_FIELD_LIST_CHANGE,
    GWNT_FLAT_FILE_RCP_STATUS_CHANGE,
    GWNT_FLAT_FILE_FIELD_APPEARANCE_CHANGE,
    GWNT_FLAT_FILE_DUMMY_CHANGE_2,
    GWNT_FLAT_FILE_DUMMY_CHANGE_3,

    GWNT_SPOOL_DOC_OR_PAPER_SIZE,

    GWNT_VIEW_STATE_CHANGE,

    GWNT_INK_HAS_TARGET,

    GWNT_PAGE_STATE_CHANGE,

    GWNT_DOCUMENT_CHANGE,

    GWNT_DISPLAY_CHANGE,
    GWNT_DISPLAY_LIST_CHANGE,

    GWNT_SPLINE_MARKER_SHAPE,
    GWNT_SPLINE_POINT,
    GWNT_SPLINE_POLYLINE,
    GWNT_SPLINE_SMOOTHNESS,
    GWNT_SPLINE_OPEN_CLOSE_CHANGE,

    GWNT_UNUSED_1,

    GWNT_SPREADSHEET_ACTIVE_CELL_CHANGE,
    GWNT_SPREADSHEET_EDIT_BAR_CHANGE,
    GWNT_SPREADSHEET_SELECTION_CHANGE,
    GWNT_SPREADSHEET_CELL_WIDTH_HEIGHT_CHANGE,
    GWNT_SPREADSHEET_DOC_ATTR_CHANGE,
    GWNT_SPREADSHEET_CELL_ATTR_CHANGE,
    GWNT_SPREADSHEET_CELL_NOTES_CHANGE,
    GWNT_SPREADSHEET_DATA_RANGE_CHANGE,

    GWNT_FLOAT_FORMAT_CHANGE,

    GWNT_MAP_APP_CHANGE,
    GWNT_MAP_LIBRARY_CHANGE,

    GWNT_TEXT_NAME_CHANGE,
    GWNT_CARD_BACK_CHANGE,
    
    GWNT_TEXT_OBJECT_HAS_FOCUS,
    GWNT_TEXT_CONTEXT,
    GWNT_TEXT_REPLACE_WITH_HWR,

    GWNT_HELP_CONTEXT_CHANGE,
    GWNT_FLOAT_FORMAT_INIT,
    GWNT_HARD_ICON_BAR_FUNCTION,
    GWNT_STARTUP_INDEXED_APP,
    GWNT_SPOOL_PRINTING_COMPLETE,
    GWNT_MODAL_WIN_CHANGE,
    GWNT_SPREADSHEET_NAME_CHANGE,
    GWNT_DOCUMENT_OPEN_COMPLETE,
    GWNT_EMAIL_SCAN_INBOX,
    GWNT_FOCUS_WINDOW_KBD_STATUS,
    GWNT_TAB_DOUBLE_CLICK,
    GWNT_PAGE_INFO_STATE_CHANGE,
    GWNT_CURSOR_POSITION_CHANGE,

    GWNT_FAX_NEW_JOB_CREATED,
    GWNT_FAX_NEW_JOB_COMPLETED,

    GWNT_EMAIL_DATABASE_CHANGE,
    GWNT_EMAIL_STATUS_CHANGE,
    GWNT_EMAIL_PAGE_PANEL_UPDATE,

    GWNT_PCCOM_DISPLAY_CHAR,
    GWNT_PCCOM_DISPLAY_STRING,
    GWNT_PCCOM_EXIT,

    GWNT_FONTS_ADDED,
    GWNT_FONTS_DELETED,

    GWNT_INK_GESTURE,
    GWNT_TEXT_REPLACE_GESTURE,

    GWNT_MAILBOX_SEND_CONTEXT,
    GWNT_PAGE_NAME_CHANGE,
    GWNT_GAME_STATUS_CHANGE,
    GWNT_DELETE_VARIABLE_GRAPHIC,
    GWNT_TEXT_HYPERLINKABILITY_CHANGE,
    GWNT_CONTENT_CONTEXT_CHANGE,
    GWNT_CONTENT_BOOK_CHANGE,
    GWNT_HYPERLINK_STATUS_CHANGE,

    GWNT_BEGIN_FAX_CONNECTION,
    GWNT_BEGIN_DATA_CONNECTION,
    GWNT_END_SERIAL_CONNECTION,
    GWNT_LOST_SERIAL_CONNECTION,

    GWNT_FAX_DESTINATION_CHANGE,
    GWNT_FAX_DIAL_ASSIST_CHANGE,
    GWNT_FAX_LAST_DESTINATIONS_CHANGE,
    GWNT_COVER_PAGE_CHANGE,
    GWNT_FOAM_DB_CHANGE,

    GWNT_INIT_FILE_CHANGE,
    GWNT_KEYBOARD_EVENT,
    GWNT_NAVIGATE_ENTRY_CHANGE,
    GWNT_NAVIGATE_DELETE_ENTRY,

    GWNT_UNUSED_2,
    GWNT_UNUSED_3,
    GWNT_UNUSED_4,
    GWNT_UNUSED_5,

    GWNT_CURRENT_COMPONENT_CHANGE,
    GWNT_CONTACT_LIST_CUR_SELECTION,

    GWNT_CONTACT_LOG_CONTACT_LOG_CHANGE,
    GWNT_CONTACT_LOG_RECENT_CALLS_CHANGE,
    GWNT_CONTACT_LOG_RECENT_FAXES_CHANGE,
    GWNT_CONTACT_LOG_RECENT_MESSAGES_CHANGE,

    GWNT_INDICATOR_LOG_EVENT,

    GWNT_RESPONDER_NOTIFICATION,

    GWNT_FOAM_AUTO_SAVE,
    GWNT_FOAM_GAINED_FULL_SCREEN_EXCL,
    GWNT_FOAM_LOST_FULL_SCREEN_EXCL,

    GWNT_ACCESS_POINT_CHANGE,

    GWNT_INDICATOR_REPLACE_ICON_GLYPH,
    GWNT_INDICATOR_REPLACE_TEXT_GLYPH,
    GWNT_INDICATOR_SET_ACTIVE_CALL,
    GWNT_INDICATOR_SET_NUM_UNREAD_DOCUMENTS,
    GWNT_INDICATOR_CHANGE_NUM_UNREAD_DOCUMENTS,
    GWNT_INDICATOR_CLEAR_NUM_UNREAD_DOCUMENTS,
    GWNT_INDICATOR_SET_NUM_OUTGOING_DOCUMENTS,
    GWNT_INDICATOR_CHANGE_NUM_OUTGOING_DOCUMENTS,
    GWNT_INDICATOR_SET_CUSTOM_NOTE,
    GWNT_INDICATOR_SET_MAIN_WINDOW_VISIBILITY,

    GWNT_VIEWER_DOCUMENT_STATUS_CHANGE,
    GWNT_PCMCIA_CARD_CHANGE,

    GWNT_INDICATOR_REFRESH_NOTIFY,

    GWNT_SECURITY_PIN_CODE_REQUEST,
    GWNT_SECURITY_LOCK_TIME_OUT,
    GWNT_SECURITY_LEVEL,

    GWNT_DATASTORE_CHANGE,

    GWNT_VIEWER_SHUTTING_DOWN,

    GWNT_INDICATOR_SET_TERMINATE_HANDLING,
    GWNT_INDICATOR_PUT_UP_FLASHING_NOTE,
    GWNT_INDICATOR_PUT_UP_INFORMATION_NOTE,
    GWNT_INDICATOR_HANDLE_ECI_CMT_TERMINATE_STATUS,
    GWNT_INDICATOR_HANDLE_ECI_NETWORK_TERMINATE_STATUS,

    GWNT_SECURITY_SYSTEM_LOCKED,

    GWNT_FOAM_IGNORE_BRING_TO_TOP,

    GWNT_VIEWER_DOCUMENT_CHANGE,

    GWNT_INK_DIGITIZER_COORDS,

    GWNT_VIEWER_LOAD_UNREAD_DOCUMENT,

    GWNT_LOGIN_INITIALIZE,
    GWNT_LOGIN_ATTACH,
    GWNT_LOGIN_DETACH,
    
    GWNT_PENELOPE_HARDWARE_NOTIFICATION,
    GWNT_PENELOPE_RADIO_STATUS_NOTIFICATION,

    GWNT_PPP_STATUS_NOTIFICATION,
    GWNT_CONFIRM_FIELD_CHANGE,
    GWNT_PARENTAL_CONTROL_CHANGE,
    GWNT_SCREEN_SAVER_STATUS_NOTIFICATION,
    GWNT_PARENTAL_CONTROL_WEBSITE_LIST_CHANGE,
    GWNT_INSTANT_SUSPEND_RESUME_NOTIFICATION,

    GWNT_TCPIP_LINK_STATUS,
    GWNT_TCPIP_DHCP_STATUS
} GeoWorksNotificationType;

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	GenApplication GCNList enums
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	The UI library's GenApplicationClass supports its very own GCN
	(General Change Notification) system separate from the kernel's.
	Lists within this system are identified by a GCNListType, whose
	enumerations are seperate from that of the kernel's GCN system.

	This section contains the enumerations of the GCNLT_type field for
	GCNListType used within a GenApplication for the case of
	GCNLT_manuf = MANUFACTURER_ID_GEOWORKS.

	!!WARNING!!!!WARNING!!!!WARNING!!!!WARNING!!!!WARNING!!!!WARNING!!

	NOTE:	The entrys of the form PADDING_GAGCNLT_INVALID_ITEM_xxx
		(where xxx is a number) are there to make the compiler give
		the real items numbers that are multiples of two.  If you
		add an item but forget to add a padding/spacer item then
		you will be very, very unhappy.

	!!WARNING!!!!WARNING!!!!WARNING!!!!WARNING!!!!WARNING!!!!WARNING!!

	NOTE:  Be sure to update the "C" version of this file as
	       well -- they should always match.

	Name	Date		Description
	----	----		-----------
	doug	1/92		Initial version
	JDM	92.07.23	Added the padding entries to accomodate the
				need for valid entries having values that
				are multiples of two (2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

typedef enum /* word */ {
    GAGCNLT_SELF_LOAD_OPTIONS = 0x6800,	/* hi mom */
    GAGCNLT_GEN_CONTROL_NOTIFY_STATUS_CHANGE = 0x6802,

    GAGCNLT_APP_TARGET_NOTIFY_SELECT_STATE_CHANGE = 0x6804,
    GAGCNLT_EDIT_CONTROL_NOTIFY_UNDO_STATE_CHANGE = 0x6806,

    GAGCNLT_APP_TARGET_NOTIFY_TEXT_CHAR_ATTR_CHANGE = 0x6808,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_PARA_ATTR_CHANGE = 0x680a,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_TYPE_CHANGE = 0x680c,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_SELECTION_CHANGE = 0x680e,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_COUNT_CHANGE = 0x6810,
    GAGCNLT_APP_TARGET_NOTIFY_STYLE_TEXT_CHANGE = 0x6812,
    GAGCNLT_APP_TARGET_NOTIFY_STYLE_SHEET_TEXT_CHANGE = 0x6814,

    GAGCNLT_APP_TARGET_NOTIFY_TEXT_STYLE_CHANGE = 0x6816,
    GAGCNLT_APP_TARGET_NOTIFY_FONT_CHANGE = 0x6818,
    GAGCNLT_APP_TARGET_NOTIFY_POINT_SIZE_CHANGE = 0x681a,
    GAGCNLT_APP_TARGET_NOTIFY_FONT_ATTR_CHANGE = 0x681c,
    GAGCNLT_APP_TARGET_NOTIFY_JUSTIFICATION_CHANGE = 0x681e,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_FG_COLOR_CHANGE = 0x6820,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_BG_COLOR_CHANGE = 0x6822,
    GAGCNLT_APP_TARGET_NOTIFY_PARA_COLOR_CHANGE = 0x6824,
    GAGCNLT_APP_TARGET_NOTIFY_BORDER_COLOR_CHANGE = 0x6826,

    GAGCNLT_APP_TARGET_NOTIFY_SEARCH_SPELL_CHANGE = 0x6828,
    GAGCNLT_APP_TARGET_NOTIFY_SEARCH_REPLACE_CHANGE = 0x682a,

    GAGCNLT_APP_TARGET_NOTIFY_CHART_TYPE_CHANGE = 0x682c,
    GAGCNLT_APP_TARGET_NOTIFY_CHART_GROUP_FLAGS = 0x682e,
    GAGCNLT_APP_TARGET_NOTIFY_CHART_AXIS_ATTRIBUTES = 0x6830,
    GAGCNLT_APP_TARGET_NOTIFY_CHART_MARKER_SHAPE = 0x6832,

    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_CURRENT_TOOL_CHANGE = 0x6834,
    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_BODY_SELECTION_STATE_CHANGE = 0x6836,
    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_AREA_ATTR_CHANGE = 0x6838,
    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_LINE_ATTR_CHANGE = 0x683a,
    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_TEXT_ATTR_CHANGE = 0x683c,
    GAGCNLT_APP_TARGET_NOTIFY_STYLE_GROBJ_CHANGE = 0x683e,
    GAGCNLT_APP_TARGET_NOTIFY_STYLE_SHEET_GROBJ_CHANGE = 0x6840,
    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_BODY_INSTRUCTION_FLAGS_CHANGE = 0x6842,
    GAGCNLT_APP_TARGET_NOTIFY_GROBJ_GRADIENT_ATTR_CHANGE = 0x6844,


    GAGCNLT_APP_TARGET_NOTIFY_RULER_TYPE_CHANGE = 0x6846,
    GAGCNLT_APP_TARGET_NOTIFY_RULER_GRID_CHANGE = 0x6848,
    GAGCNLT_TEXT_RULER_OBJECTS = 0x684a,
    GAGCNLT_APP_TARGET_NOTIFY_RULER_GUIDE_CHANGE = 0x684c,

    GAGCNLT_APP_TARGET_NOTIFY_BITMAP_CURRENT_TOOL_CHANGE = 0x684e,
    GAGCNLT_APP_TARGET_NOTIFY_BITMAP_CURRENT_FORMAT_CHANGE = 0x6850,

    GAGCNLT_APP_TARGET_NOTIFY_FLAT_FILE_FIELD_PROPERTIES_STATUS_CHANGE = 0x6852,
    GAGCNLT_APP_TARGET_NOTIFY_FLAT_FILE_FIELD_LIST_CHANGE = 0x6854,
    GAGCNLT_APP_TARGET_NOTIFY_FLAT_FILE_RCP_STATUS_CHANGE = 0x6856,
    GAGCNLT_APP_TARGET_NOTIFY_FLAT_FILE_FIELD_APPEARANCE_CHANGE = 0x6858,
    GAGCNLT_APP_TARGET_NOTIFY_FLAT_FILE_DUMMY_CHANGE_2 = 0x685a,
    GAGCNLT_APP_TARGET_NOTIFY_FLAT_FILE_DUMMY_CHANGE_3 = 0x685c,

    GAGCNLT_APP_NOTIFY_DOC_SIZE_CHANGE = 0x685e,
    GAGCNLT_APP_NOTIFY_PAPER_SIZE_CHANGE = 0x6860,

    GAGCNLT_APP_TARGET_NOTIFY_VIEW_STATE_CHANGE = 0x6862,
    GAGCNLT_CONTROLLED_GEN_VIEW_OBJECTS = 0x6864,

    GAGCNLT_APP_TARGET_NOTIFY_INK_STATE_CHANGE = 0x6866,
    GAGCNLT_CONTROLLED_INK_OBJECTS = 0x6868,

    GAGCNLT_APP_TARGET_NOTIFY_PAGE_STATE_CHANGE = 0x686a,

    GAGCNLT_APP_TARGET_NOTIFY_DOCUMENT_CHANGE = 0x686c,

    GAGCNLT_APP_TARGET_NOTIFY_DISPLAY_CHANGE = 0x686e,
    GAGCNLT_APP_TARGET_NOTIFY_DISPLAY_LIST_CHANGE = 0x6870,

    GAGCNLT_APP_TARGET_NOTIFY_SPLINE_MARKER_SHAPE = 0x6872,
    GAGCNLT_APP_TARGET_NOTIFY_SPLINE_POINT = 0x6874,
    GAGCNLT_APP_TARGET_NOTIFY_SPLINE_POLYLINE = 0x6876,
    GAGCNLT_APP_TARGET_NOTIFY_SPLINE_SMOOTHNESS = 0x6878,
    GAGCNLT_APP_TARGET_NOTIFY_SPLINE_OPEN_CLOSE_CHANGE = 0x687a,

    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_ACTIVE_CELL_CHANGE = 0x687c,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_EDIT_BAR_CHANGE = 0x687e,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_SELECTION_CHANGE = 0x6880,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_CELL_WIDTH_HEIGHT_CHANGE = 0x6882,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_DOC_ATTR_CHANGE = 0x6884,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_CELL_ATTR_CHANGE = 0x6886,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_CELL_NOTES_CHANGE = 0x6888,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_DATA_RANGE_CHANGE = 0x688a,

    GAGCNLT_APP_TARGET_NOTIFY_TEXT_NAME_CHANGE = 0x688c,

    GAGCNLT_FLOAT_FORMAT_CHANGE = 0x688e,

    GAGCNLT_DISPLAY_OBJECTS_WITH_RULERS = 0x6890,

    GAGCNLT_APP_TARGET_NOTIFY_APP_CHANGE = 0x6892,
    GAGCNLT_APP_TARGET_NOTIFY_LIBRARY_CHANGE = 0x6894,

    GAGCNLT_WINDOWS = 0x6896,
    GAGCNLT_STARTUP_LOAD_OPTIONS = 0x6898,

    GAGCNLT_APP_TARGET_NOTIFY_CARD_BACK_CHANGE = 0x689a,

    /* *** TO BE MOVED LATER ***/


    GAGCNLT_NOTIFY_FOCUS_TEXT_OBJECT = 0x689c,

    GAGCNLT_NOTIFY_TEXT_CONTEXT = 0x689e,

    GAGCNLT_NOTIFY_HELP_CONTEXT_CHANGE = 0x68a0,

    GAGCNLT_FLOAT_FORMAT_INIT = 0x68a2,
    
    GAGCNLT_ALWAYS_INTERACTABLE_WINDOWS = 0x68a4,
    GAGCNLT_USER_DO_DIALOGS = 0x68a6,

    GAGCNLT_MODAL_WIN_CHANGE = 0x68a8,
    GAGCNLT_APP_TARGET_NOTIFY_SPREADSHEET_NAME_CHANGE = 0x68aa,
    GAGCNLT_CONTROLLERS_WITHIN_USER_DO_DIALOGS = 0x68ac,
    GAGCNLT_FOCUS_WINDOW_KBD_STATUS = 0x68ae,
    GAGCNLT_APP_TARGET_NOTIFY_PAGE_INFO_STATE_CHANGE = 0x68b0,
    GAGCNLT_APP_TARGET_NOTIFY_CURSOR_POSITION_CHANGE = 0x68b2,
    GAGCNLT_MAILBOX_SEND_CONTROL = 0x68b4,
    GAGCNLT_APP_TARGET_NOTIFY_PAGE_NAME_CHANGE = 0x68b6,
    GAGCNLT_GAME_STATUS_CHANGE = 0x68b8,
    GAGCNLT_APP_TARGET_NOTIFY_TEXT_HYPERLINKABILITY_CHANGE = 0x68ba,
    GAGCNLT_NOTIFY_CONTENT_CONTEXT_CHANGE = 0x68bc,
    GAGCNLT_NOTIFY_CONTENT_BOOK_CHANGE = 0x68be,
    GAGCNLT_APP_TARGET_NOTIFY_HYPERLINK_STATUS_CHANGE = 0x68c0,
    GAGCNLT_NOTIFY_NAVIGATE_ENTRY_CHANGE = 0x68c2,
    
    GAGCNLT_FOAM_NOTIFICATIONS = 0x68c4,

    GAGCNLT_FULL_SCREEN_EXCL_CHANGE = 0x68c6,

    GAGCNLT_VIEWER_NOTIFICATIONS = 0x68c8,

    GAGCNLT_DATASTORE_CHANGE = 0x68ca

} GeoWorksGenAppGCNListType;

typedef enum /* word */ {
    MGCNLT_ACTIVE_LIST=0x0000,
    MGCNLT_APP_STARTUP=0x0002
} GeoWorksMetaGCNListType;

typedef enum {
    VCGCNLT_TARGET_NOTIFY_TEXT_PARA_ATTR_CHANGE = 0x4a00,
    PADDING_VCGCNLT_INVALID_ITEM_000
} GeoWorksVisContentGCNListType;
/*
 ****************************************************************************
 *	DESCRIPTION:	Transfer item types
 ****************************************************************************
 */

typedef enum /* word */ {
    CIF_TEXT,
    CIF_GRAPHICS_STRING,
    CIF_FILES,
    CIF_SPREADSHEET,
    CIF_INK,
    CIF_GROBJ,
    CIF_GEODEX,
    CIF_BITMAP,
    CIF_SOUND_SYNTH,
    CIF_SOUND_SAMPLE
} ClipboardItemFormat;

/*
 ****************************************************************************
 *	DESCRIPTION:	Text Object variable types
 ****************************************************************************
 */

typedef enum {
    VTVT_PAGE_NUMBER,
    VTVT_PAGE_NUMBER_IN_SECTION,
    VTVT_NUMBER_OF_PAGES,
    VTVT_NUMBER_OF_PAGES_IN_SECTION,
    VTVT_SECTION_NUMBER,
    VTVT_NUMBER_OF_SECTIONS,
    VTVT_CREATION_DATE_TIME,
    VTVT_MODIFICATION_DATE_TIME,
    VTVT_CURRENT_DATE_TIME,
    VTVT_STORED_DATE_TIME,
    VTVT_CONTEXT_PAGE,
    VTVT_CONTEXT_PAGE_IN_SECTION,
    VTVT_CONTEXT_SECTION,
    VTVT_CONTEXT_NAME,
    VTVT_HOTSPOT,
} VisTextVariableType;


/*
 ****************************************************************************
 *	DESCRIPTION:	Escape Codes for GR_ESCAPE GString Elements
 ****************************************************************************
 */

typedef enum /* word */ {
    GGSEC_HOTSPOT = 0x4200, 	    	    	/* used by Condo */
} GeoworksGStringEscapeCode;

#endif
