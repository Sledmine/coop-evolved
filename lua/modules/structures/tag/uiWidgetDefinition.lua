return { {
    address = "0x0",
    is = "int",
    metaName = "UIWidgetType",
    name = "widgetType",
    offset = 0,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x2",
    is = "int",
    metaName = "UIControllerIndex",
    name = "controllerIndex",
    offset = 2,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x4",
    fields = { {
        address = "0x0",
        count = 32,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "string",
        offset = 0,
        size = 32,
        what = "field"
      } },
    is = "struct",
    metaName = "String32",
    name = "name",
    offset = 4,
    size = 32,
    type = "String32",
    what = "field"
  }, {
    address = "0x24",
    fields = { {
        address = "0x0",
        is = "int",
        name = "top",
        offset = 0,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2",
        is = "int",
        name = "left",
        offset = 2,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "bottom",
        offset = 4,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x6",
        is = "int",
        name = "right",
        offset = 6,
        size = 2,
        type = "short",
        what = "field"
      } },
    is = "struct",
    metaName = "Rectangle2D",
    name = "bounds",
    offset = 36,
    size = 8,
    type = "Rectangle2D",
    what = "field"
  }, {
    address = "0x2c",
    fields = { {
        address = "0x0",
        is = "int",
        name = "passUnhandledEventsToFocusedChild",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "pauseGameTime",
        offset = 1,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "flashBackgroundBitmap",
        offset = 2,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "dpadUpDownTabsThruChildren",
        offset = 3,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "dpadLeftRightTabsThruChildren",
        offset = 4,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "dpadUpDownTabsThruListItems",
        offset = 5,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "dpadLeftRightTabsThruListItems",
        offset = 6,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "dontFocusASpecificChildWidget",
        offset = 7,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "passUnhandledEventsToAllChildren",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "renderRegardlessOfControllerIndex",
        offset = 9,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "passHandledEventsToAllChildren",
        offset = 10,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "returnToMainMenuIfNoHistory",
        offset = 11,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "alwaysUseTagControllerIndex",
        offset = 12,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "alwaysUseNiftyRenderFx",
        offset = 13,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "dontPushHistory",
        offset = 14,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "forceHandleMouse",
        offset = 15,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      } },
    is = "struct",
    metaName = "UIWidgetDefinitionFlags",
    name = "flags",
    offset = 44,
    size = 4,
    type = "UIWidgetDefinitionFlags",
    what = "field"
  }, {
    address = "0x30",
    is = "int",
    name = "millisecondsToAutoClose",
    offset = 48,
    size = 4,
    type = "int",
    what = "field"
  }, {
    address = "0x34",
    is = "int",
    name = "millisecondsAutoCloseFadeTime",
    offset = 52,
    size = 4,
    type = "int",
    what = "field"
  }, {
    address = "0x38",
    fields = { {
        address = "0x0",
        is = "int",
        metaName = "TagGroup",
        name = "tagGroup",
        offset = 0,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "ptr",
        name = "path",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "pathSize",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        fields = { {
            address = "0x0",
            is = "int",
            name = "value",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x0",
            is = "int",
            name = "index",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "id",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "union",
        metaName = "TableResourceHandle",
        name = "tagHandle",
        offset = 12,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      } },
    is = "struct",
    metaName = "TagReference",
    name = "backgroundBitmap",
    offset = 56,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x48",
    fields = { {
        address = "0x0",
        is = "int",
        name = "count",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        count = 0,
        elementSize = 36,
        fields = { {
            address = "0x0",
            is = "int",
            metaName = "UIGameDataInputReferenceFunction",
            name = "function",
            offset = 0,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x2",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22484",
            offset = 2,
            size = 2,
            what = "field"
          }, {
            address = "0x4",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22507",
            offset = 4,
            size = 32,
            what = "field"
          } },
        is = "ptr",
        name = "elements",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        count = 0,
        elementSize = 20,
        fields = { {
            address = "0x0",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "ptr",
            name = "name",
            offset = 0,
            size = 4,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "maximum",
            offset = 4,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x8",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "padding",
            offset = 8,
            size = 4,
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "elementsSize",
            offset = 12,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x10",
            count = 0,
            elementSize = "none",
            elementType = "void",
            is = "ptr",
            name = "fields",
            offset = 16,
            size = 4,
            what = "field"
          } },
        is = "ptr",
        name = "definition",
        offset = 8,
        size = 4,
        what = "field"
      } },
    is = "struct",
    name = "gameDataInputs",
    offset = 72,
    size = 12,
    what = "field"
  }, {
    address = "0x54",
    fields = { {
        address = "0x0",
        is = "int",
        name = "count",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        count = 0,
        elementSize = 72,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "closeCurrentWidget",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "closeOtherWidget",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "closeAllWidgets",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "openWidget",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "reloadSelf",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "reloadOtherWidget",
                offset = 5,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "giveFocusToWidget",
                offset = 6,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "runFunction",
                offset = 7,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "replaceSelfWWidget",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "goBackToPreviousWidget",
                offset = 9,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "runScenarioScript",
                offset = 10,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "tryToBranchOnFailure",
                offset = 11,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "EventHandlerReferencesFlags",
            name = "flags",
            offset = 0,
            size = 4,
            type = "EventHandlerReferencesFlags",
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            metaName = "UIEventType",
            name = "eventType",
            offset = 4,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            metaName = "UIEventHandlerReferenceFunction",
            name = "function",
            offset = 6,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x8",
            fields = { {
                address = "0x0",
                is = "int",
                metaName = "TagGroup",
                name = "tagGroup",
                offset = 0,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x4",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "ptr",
                name = "path",
                offset = 4,
                size = 4,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "pathSize",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "value",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "index",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "id",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  } },
                is = "union",
                metaName = "TableResourceHandle",
                name = "tagHandle",
                offset = 12,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              } },
            is = "struct",
            metaName = "TagReference",
            name = "widgetTag",
            offset = 8,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x18",
            fields = { {
                address = "0x0",
                is = "int",
                metaName = "TagGroup",
                name = "tagGroup",
                offset = 0,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x4",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "ptr",
                name = "path",
                offset = 4,
                size = 4,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "pathSize",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "value",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "index",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "id",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  } },
                is = "union",
                metaName = "TableResourceHandle",
                name = "tagHandle",
                offset = 12,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              } },
            is = "struct",
            metaName = "TagReference",
            name = "soundEffect",
            offset = 24,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x28",
            fields = { {
                address = "0x0",
                count = 32,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "string",
                offset = 0,
                size = 32,
                what = "field"
              } },
            is = "struct",
            metaName = "String32",
            name = "script",
            offset = 40,
            size = 32,
            type = "String32",
            what = "field"
          } },
        is = "ptr",
        name = "elements",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        count = 0,
        elementSize = 20,
        fields = { {
            address = "0x0",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "ptr",
            name = "name",
            offset = 0,
            size = 4,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "maximum",
            offset = 4,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x8",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "padding",
            offset = 8,
            size = 4,
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "elementsSize",
            offset = 12,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x10",
            count = 0,
            elementSize = "none",
            elementType = "void",
            is = "ptr",
            name = "fields",
            offset = 16,
            size = 4,
            what = "field"
          } },
        is = "ptr",
        name = "definition",
        offset = 8,
        size = 4,
        what = "field"
      } },
    is = "struct",
    name = "eventHandlers",
    offset = 84,
    size = 12,
    what = "field"
  }, {
    address = "0x60",
    fields = { {
        address = "0x0",
        is = "int",
        name = "count",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        count = 0,
        elementSize = 34,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                count = 32,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "string",
                offset = 0,
                size = 32,
                what = "field"
              } },
            is = "struct",
            metaName = "String32",
            name = "searchString",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            metaName = "UIReplaceFunction",
            name = "replaceFunction",
            offset = 32,
            size = 2,
            type = "short",
            what = "field"
          } },
        is = "ptr",
        name = "elements",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        count = 0,
        elementSize = 20,
        fields = { {
            address = "0x0",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "ptr",
            name = "name",
            offset = 0,
            size = 4,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "maximum",
            offset = 4,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x8",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "padding",
            offset = 8,
            size = 4,
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "elementsSize",
            offset = 12,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x10",
            count = 0,
            elementSize = "none",
            elementType = "void",
            is = "ptr",
            name = "fields",
            offset = 16,
            size = 4,
            what = "field"
          } },
        is = "ptr",
        name = "definition",
        offset = 8,
        size = 4,
        what = "field"
      } },
    is = "struct",
    name = "searchAndReplaceFunctions",
    offset = 96,
    size = 12,
    what = "field"
  }, {
    address = "0x6c",
    count = 128,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad24420",
    offset = 108,
    size = 128,
    what = "field"
  }, {
    address = "0xec",
    fields = { {
        address = "0x0",
        is = "int",
        metaName = "TagGroup",
        name = "tagGroup",
        offset = 0,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "ptr",
        name = "path",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "pathSize",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        fields = { {
            address = "0x0",
            is = "int",
            name = "value",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x0",
            is = "int",
            name = "index",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "id",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "union",
        metaName = "TableResourceHandle",
        name = "tagHandle",
        offset = 12,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      } },
    is = "struct",
    metaName = "TagReference",
    name = "textLabelUnicodeStringsList",
    offset = 236,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0xfc",
    fields = { {
        address = "0x0",
        is = "int",
        metaName = "TagGroup",
        name = "tagGroup",
        offset = 0,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "ptr",
        name = "path",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "pathSize",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        fields = { {
            address = "0x0",
            is = "int",
            name = "value",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x0",
            is = "int",
            name = "index",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "id",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "union",
        metaName = "TableResourceHandle",
        name = "tagHandle",
        offset = 12,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      } },
    is = "struct",
    metaName = "TagReference",
    name = "textFont",
    offset = 252,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x10c",
    fields = { {
        address = "0x0",
        is = "float",
        name = "a",
        offset = 0,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x4",
        is = "float",
        name = "r",
        offset = 4,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x8",
        is = "float",
        name = "g",
        offset = 8,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0xc",
        is = "float",
        name = "b",
        offset = 12,
        size = 4,
        type = "float",
        what = "field"
      } },
    is = "struct",
    metaName = "ColorARGB",
    name = "textColor",
    offset = 268,
    size = 16,
    type = "ColorARGB",
    what = "field"
  }, {
    address = "0x11c",
    is = "int",
    metaName = "UIJustification",
    name = "justification",
    offset = 284,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x11e",
    fields = { {
        address = "0x0",
        is = "int",
        name = "editable",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "password",
        offset = 1,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "flashing",
        offset = 2,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "dontDoThatWeirdFocusTest",
        offset = 3,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      } },
    is = "struct",
    metaName = "UIWidgetDefinitionFlags1",
    name = "flags1",
    offset = 286,
    size = 4,
    type = "UIWidgetDefinitionFlags1",
    what = "field"
  }, {
    address = "0x122",
    count = 12,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad24622",
    offset = 290,
    size = 12,
    what = "field"
  }, {
    address = "0x12e",
    is = "int",
    name = "stringListIndex",
    offset = 302,
    size = 2,
    type = "word",
    unsigned = true,
    what = "field"
  }, {
    address = "0x130",
    is = "int",
    name = "horizOffset",
    offset = 304,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x132",
    is = "int",
    name = "vertOffset",
    offset = 306,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x134",
    count = 26,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad24729",
    offset = 308,
    size = 26,
    what = "field"
  }, {
    address = "0x14e",
    count = 2,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad24753",
    offset = 334,
    size = 2,
    what = "field"
  }, {
    address = "0x150",
    fields = { {
        address = "0x0",
        is = "int",
        name = "listItemsGeneratedInCode",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "listItemsFromStringListTag",
        offset = 1,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "listItemsOnlyOneTooltip",
        offset = 2,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "listSinglePreviewNoScroll",
        offset = 3,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      } },
    is = "struct",
    metaName = "UIWidgetDefinitionFlags2",
    name = "flags2",
    offset = 336,
    size = 4,
    type = "UIWidgetDefinitionFlags2",
    what = "field"
  }, {
    address = "0x154",
    fields = { {
        address = "0x0",
        is = "int",
        metaName = "TagGroup",
        name = "tagGroup",
        offset = 0,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "ptr",
        name = "path",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "pathSize",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        fields = { {
            address = "0x0",
            is = "int",
            name = "value",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x0",
            is = "int",
            name = "index",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "id",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "union",
        metaName = "TableResourceHandle",
        name = "tagHandle",
        offset = 12,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      } },
    is = "struct",
    metaName = "TagReference",
    name = "listHeaderBitmap",
    offset = 340,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x164",
    fields = { {
        address = "0x0",
        is = "int",
        metaName = "TagGroup",
        name = "tagGroup",
        offset = 0,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "ptr",
        name = "path",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "pathSize",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        fields = { {
            address = "0x0",
            is = "int",
            name = "value",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x0",
            is = "int",
            name = "index",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "id",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "union",
        metaName = "TableResourceHandle",
        name = "tagHandle",
        offset = 12,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      } },
    is = "struct",
    metaName = "TagReference",
    name = "listFooterBitmap",
    offset = 356,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x174",
    fields = { {
        address = "0x0",
        is = "int",
        name = "top",
        offset = 0,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2",
        is = "int",
        name = "left",
        offset = 2,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "bottom",
        offset = 4,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x6",
        is = "int",
        name = "right",
        offset = 6,
        size = 2,
        type = "short",
        what = "field"
      } },
    is = "struct",
    metaName = "Rectangle2D",
    name = "headerBounds",
    offset = 372,
    size = 8,
    type = "Rectangle2D",
    what = "field"
  }, {
    address = "0x17c",
    fields = { {
        address = "0x0",
        is = "int",
        name = "top",
        offset = 0,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2",
        is = "int",
        name = "left",
        offset = 2,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "bottom",
        offset = 4,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x6",
        is = "int",
        name = "right",
        offset = 6,
        size = 2,
        type = "short",
        what = "field"
      } },
    is = "struct",
    metaName = "Rectangle2D",
    name = "footerBounds",
    offset = 380,
    size = 8,
    type = "Rectangle2D",
    what = "field"
  }, {
    address = "0x184",
    count = 32,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad24950",
    offset = 388,
    size = 32,
    what = "field"
  }, {
    address = "0x1a4",
    fields = { {
        address = "0x0",
        is = "int",
        metaName = "TagGroup",
        name = "tagGroup",
        offset = 0,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "ptr",
        name = "path",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "pathSize",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        fields = { {
            address = "0x0",
            is = "int",
            name = "value",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x0",
            is = "int",
            name = "index",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "id",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "union",
        metaName = "TableResourceHandle",
        name = "tagHandle",
        offset = 12,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      } },
    is = "struct",
    metaName = "TagReference",
    name = "extendedDescriptionWidget",
    offset = 420,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x1b4",
    count = 32,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad25020",
    offset = 436,
    size = 32,
    what = "field"
  }, {
    address = "0x1d4",
    count = 256,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad25044",
    offset = 468,
    size = 256,
    what = "field"
  }, {
    address = "0x2d4",
    fields = { {
        address = "0x0",
        is = "int",
        name = "count",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        count = 0,
        elementSize = 80,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                metaName = "TagGroup",
                name = "tagGroup",
                offset = 0,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x4",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "ptr",
                name = "path",
                offset = 4,
                size = 4,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "pathSize",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "value",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "index",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "id",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  } },
                is = "union",
                metaName = "TableResourceHandle",
                name = "tagHandle",
                offset = 12,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              } },
            is = "struct",
            metaName = "TagReference",
            name = "widgetTag",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            fields = { {
                address = "0x0",
                count = 32,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "string",
                offset = 0,
                size = 32,
                what = "field"
              } },
            is = "struct",
            metaName = "String32",
            name = "name",
            offset = 16,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "int",
                name = "loadIfEventHandlerFunctionFails",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ConditionalWidgetReferenceFlags",
            name = "flags",
            offset = 48,
            size = 4,
            type = "ConditionalWidgetReferenceFlags",
            what = "field"
          }, {
            address = "0x34",
            is = "int",
            name = "customControllerIndex",
            offset = 52,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x36",
            count = 26,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23298",
            offset = 54,
            size = 26,
            what = "field"
          } },
        is = "ptr",
        name = "elements",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        count = 0,
        elementSize = 20,
        fields = { {
            address = "0x0",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "ptr",
            name = "name",
            offset = 0,
            size = 4,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "maximum",
            offset = 4,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x8",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "padding",
            offset = 8,
            size = 4,
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "elementsSize",
            offset = 12,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x10",
            count = 0,
            elementSize = "none",
            elementType = "void",
            is = "ptr",
            name = "fields",
            offset = 16,
            size = 4,
            what = "field"
          } },
        is = "ptr",
        name = "definition",
        offset = 8,
        size = 4,
        what = "field"
      } },
    is = "struct",
    name = "conditionalWidgets",
    offset = 724,
    size = 12,
    what = "field"
  }, {
    address = "0x2e0",
    count = 128,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad25198",
    offset = 736,
    size = 128,
    what = "field"
  }, {
    address = "0x360",
    count = 128,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad25223",
    offset = 864,
    size = 128,
    what = "field"
  }, {
    address = "0x3e0",
    fields = { {
        address = "0x0",
        is = "int",
        name = "count",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        count = 0,
        elementSize = 80,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                metaName = "TagGroup",
                name = "tagGroup",
                offset = 0,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x4",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "ptr",
                name = "path",
                offset = 4,
                size = 4,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "pathSize",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "value",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "index",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "id",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  } },
                is = "union",
                metaName = "TableResourceHandle",
                name = "tagHandle",
                offset = 12,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              } },
            is = "struct",
            metaName = "TagReference",
            name = "widgetTag",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            fields = { {
                address = "0x0",
                count = 32,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "string",
                offset = 0,
                size = 32,
                what = "field"
              } },
            is = "struct",
            metaName = "String32",
            name = "name",
            offset = 16,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "int",
                name = "useCustomControllerIndex",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ChildWidgetReferenceFlags",
            name = "flags",
            offset = 48,
            size = 4,
            type = "ChildWidgetReferenceFlags",
            what = "field"
          }, {
            address = "0x34",
            is = "int",
            name = "customControllerIndex",
            offset = 52,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x36",
            is = "int",
            name = "verticalOffset",
            offset = 54,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x38",
            is = "int",
            name = "horizontalOffset",
            offset = 56,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x3a",
            count = 22,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23633",
            offset = 58,
            size = 22,
            what = "field"
          } },
        is = "ptr",
        name = "elements",
        offset = 4,
        size = 4,
        what = "field"
      }, {
        address = "0x8",
        count = 0,
        elementSize = 20,
        fields = { {
            address = "0x0",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "ptr",
            name = "name",
            offset = 0,
            size = 4,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "maximum",
            offset = 4,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x8",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "padding",
            offset = 8,
            size = 4,
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "elementsSize",
            offset = 12,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x10",
            count = 0,
            elementSize = "none",
            elementType = "void",
            is = "ptr",
            name = "fields",
            offset = 16,
            size = 4,
            what = "field"
          } },
        is = "ptr",
        name = "definition",
        offset = 8,
        size = 4,
        what = "field"
      } },
    is = "struct",
    name = "childWidgets",
    offset = 992,
    size = 12,
    what = "field"
  } }
