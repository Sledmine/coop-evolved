return { {
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
    name = "dontUse",
    offset = 0,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x10",
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
    name = "wontUse",
    offset = 16,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x20",
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
    name = "cantUse",
    offset = 32,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x30",
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
        elementSize = 16,
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
            name = "sky",
            offset = 0,
            size = 16,
            type = "TagReference",
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
    name = "skies",
    offset = 48,
    size = 12,
    what = "field"
  }, {
    address = "0x3c",
    is = "int",
    metaName = "ScenarioType",
    name = "type",
    offset = 60,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x3e",
    fields = { {
        address = "0x0",
        is = "int",
        name = "cortanaHack",
        offset = 0,
        size = 2,
        type = "word",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "useDemoUi",
        offset = 1,
        size = 2,
        type = "word",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "enableColorCorrection",
        offset = 2,
        size = 2,
        type = "word",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "doNotApplyBungieCampaignTagPatches",
        offset = 3,
        size = 2,
        type = "word",
        unsigned = true,
        what = "bitfield"
      } },
    is = "struct",
    metaName = "ScenarioFlags",
    name = "flags",
    offset = 62,
    size = 2,
    type = "ScenarioFlags",
    what = "field"
  }, {
    address = "0x40",
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
        elementSize = 32,
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
            name = "childScenario",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad18205",
            offset = 16,
            size = 16,
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
    name = "childScenarios",
    offset = 64,
    size = 12,
    what = "field"
  }, {
    address = "0x4c",
    is = "float",
    name = "localNorth",
    offset = 76,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x50",
    count = 20,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad39806",
    offset = 80,
    size = 20,
    what = "field"
  }, {
    address = "0x64",
    count = 136,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad39830",
    offset = 100,
    size = 136,
    what = "field"
  }, {
    address = "0xec",
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
        elementSize = 8,
        fields = { {
            address = "0x0",
            is = "int",
            metaName = "PredictedResourceType",
            name = "type",
            offset = 0,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "resourceIndex",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
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
            name = "tag",
            offset = 4,
            size = 4,
            type = "TableResourceHandle",
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
    name = "predictedResources",
    offset = 236,
    size = 12,
    what = "field"
  }, {
    address = "0xf8",
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
        elementSize = 120,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "scripted",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "invert",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "additive",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "alwaysActive",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioFunctionFlags",
            name = "flags",
            offset = 0,
            size = 4,
            type = "ScenarioFunctionFlags",
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
            is = "float",
            name = "period",
            offset = 36,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x28",
            is = "int",
            name = "scalePeriodBy",
            offset = 40,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2a",
            is = "int",
            metaName = "WaveFunction",
            name = "function",
            offset = 42,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x2c",
            is = "int",
            name = "scaleFunctionBy",
            offset = 44,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2e",
            is = "int",
            metaName = "WaveFunction",
            name = "wobbleFunction",
            offset = 46,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x30",
            is = "float",
            name = "wobblePeriod",
            offset = 48,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x34",
            is = "float",
            name = "wobbleMagnitude",
            offset = 52,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x38",
            is = "float",
            name = "squareWaveThreshold",
            offset = 56,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x3c",
            is = "int",
            name = "stepCount",
            offset = 60,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x3e",
            is = "int",
            metaName = "FunctionType",
            name = "mapTo",
            offset = 62,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x40",
            is = "int",
            name = "sawtoothCount",
            offset = 64,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x42",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad18699",
            offset = 66,
            size = 2,
            what = "field"
          }, {
            address = "0x44",
            is = "int",
            name = "scaleResultBy",
            offset = 68,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x46",
            is = "int",
            metaName = "FunctionBoundsMode",
            name = "boundsMode",
            offset = 70,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x48",
            count = 2,
            elementSize = 4,
            elementType = "float",
            is = "array",
            name = "bounds",
            offset = 72,
            size = 8,
            what = "field"
          }, {
            address = "0x50",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad18809",
            offset = 80,
            size = 4,
            what = "field"
          }, {
            address = "0x54",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad18832",
            offset = 84,
            size = 2,
            what = "field"
          }, {
            address = "0x56",
            is = "int",
            name = "turnOffWith",
            offset = 86,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x58",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad18883",
            offset = 88,
            size = 16,
            what = "field"
          }, {
            address = "0x68",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad18907",
            offset = 104,
            size = 16,
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
    name = "functions",
    offset = 248,
    size = 12,
    what = "field"
  }, {
    address = "0x104",
    fields = { {
        address = "0x0",
        is = "int",
        name = "size",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "flags",
        offset = 4,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "fileOffset",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        count = 0,
        elementSize = "none",
        elementType = "void",
        is = "ptr",
        name = "pointer",
        offset = 12,
        size = 4,
        what = "field"
      }, {
        address = "0x10",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "padding",
        offset = 16,
        size = 4,
        what = "field"
      } },
    is = "struct",
    metaName = "Data",
    name = "editorScenarioData",
    offset = 260,
    size = 20,
    type = "Data",
    what = "field"
  }, {
    address = "0x118",
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
        elementSize = 48,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 0,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0xc",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad19065",
            offset = 12,
            size = 16,
            what = "field"
          }, {
            address = "0x1c",
            fields = { {
                address = "0x0",
                is = "int",
                name = "size",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x4",
                is = "int",
                name = "flags",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "fileOffset",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                count = 0,
                elementSize = "none",
                elementType = "void",
                is = "ptr",
                name = "pointer",
                offset = 12,
                size = 4,
                what = "field"
              }, {
                address = "0x10",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "padding",
                offset = 16,
                size = 4,
                what = "field"
              } },
            is = "struct",
            metaName = "Data",
            name = "comment",
            offset = 28,
            size = 20,
            type = "Data",
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
    name = "comments",
    offset = 280,
    size = 12,
    what = "field"
  }, {
    address = "0x124",
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
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            name = "objectNameIndex",
            offset = 32,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x22",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad19284",
            offset = 34,
            size = 2,
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
    name = "scavengerHuntObjects",
    offset = 292,
    size = 12,
    what = "field"
  }, {
    address = "0x130",
    count = 212,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad40362",
    offset = 304,
    size = 212,
    what = "field"
  }, {
    address = "0x204",
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
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            metaName = "ObjectType",
            name = "objectType",
            offset = 32,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x22",
            is = "int",
            name = "objectIndex",
            offset = 34,
            size = 2,
            type = "word",
            unsigned = true,
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
    name = "objectNames",
    offset = 516,
    size = 12,
    what = "field"
  }, {
    address = "0x210",
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
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            name = "bspIndices",
            offset = 32,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x22",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad19966",
            offset = 34,
            size = 2,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad20025",
            offset = 37,
            size = 3,
            what = "field"
          }, {
            address = "0x28",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad20048",
            offset = 40,
            size = 16,
            what = "field"
          }, {
            address = "0x38",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad20072",
            offset = 56,
            size = 8,
            what = "field"
          }, {
            address = "0x40",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad20095",
            offset = 64,
            size = 8,
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
    name = "scenery",
    offset = 528,
    size = 12,
    what = "field"
  }, {
    address = "0x21c",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad20249",
            offset = 16,
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
    name = "sceneryPalette",
    offset = 540,
    size = 12,
    what = "field"
  }, {
    address = "0x228",
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
        elementSize = 120,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "automatically",
                        offset = 0,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "onEasy",
                        offset = 1,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "onNormal",
                        offset = 2,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "onHard",
                        offset = 3,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "usePlayerAppearance",
                        offset = 4,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSpawnNotPlaced",
                    name = "notPlaced",
                    offset = 0,
                    size = 2,
                    type = "ScenarioSpawnNotPlaced",
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "desiredPermutation",
                    offset = 2,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x4",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "x",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "y",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "z",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorXYZ",
                    name = "position",
                    offset = 4,
                    size = 12,
                    type = "VectorXYZ",
                    what = "field"
                  }, {
                    address = "0x10",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "pitch",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "yaw",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "rotation",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorPYR",
                    name = "rotation",
                    offset = 16,
                    size = 12,
                    type = "VectorPYR",
                    what = "field"
                  } },
                is = "struct",
                metaName = "ScenarioObjectPlacement",
                name = "placement",
                offset = 0,
                size = 28,
                type = "ScenarioObjectPlacement",
                what = "field"
              }, {
                address = "0x1c",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20434",
                offset = 28,
                size = 4,
                what = "field"
              }, {
                address = "0x20",
                is = "int",
                name = "appearancePlayerIndex",
                offset = 32,
                size = 1,
                type = "char",
                what = "field"
              }, {
                address = "0x21",
                count = 3,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20493",
                offset = 33,
                size = 3,
                what = "field"
              }, {
                address = "0x24",
                count = 16,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20516",
                offset = 36,
                size = 16,
                what = "field"
              }, {
                address = "0x34",
                count = 8,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20540",
                offset = 52,
                size = 8,
                what = "field"
              }, {
                address = "0x3c",
                count = 8,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20563",
                offset = 60,
                size = 8,
                what = "field"
              }, {
                address = "0x44",
                is = "float",
                name = "bodyVitality",
                offset = 68,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x48",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "dead",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioUnitFlags",
                name = "flags",
                offset = 72,
                size = 4,
                type = "ScenarioUnitFlags",
                what = "field"
              }, {
                address = "0x4c",
                count = 8,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20640",
                offset = 76,
                size = 8,
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioUnitProperties",
            name = "properties",
            offset = 4,
            size = 84,
            type = "ScenarioUnitProperties",
            what = "field"
          }, {
            address = "0x58",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad20853",
            offset = 88,
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
    name = "bipeds",
    offset = 552,
    size = 12,
    what = "field"
  }, {
    address = "0x234",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21003",
            offset = 16,
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
    name = "bipedPalette",
    offset = 564,
    size = 12,
    what = "field"
  }, {
    address = "0x240",
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
        elementSize = 120,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "automatically",
                        offset = 0,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "onEasy",
                        offset = 1,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "onNormal",
                        offset = 2,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "onHard",
                        offset = 3,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "usePlayerAppearance",
                        offset = 4,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSpawnNotPlaced",
                    name = "notPlaced",
                    offset = 0,
                    size = 2,
                    type = "ScenarioSpawnNotPlaced",
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "desiredPermutation",
                    offset = 2,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x4",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "x",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "y",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "z",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorXYZ",
                    name = "position",
                    offset = 4,
                    size = 12,
                    type = "VectorXYZ",
                    what = "field"
                  }, {
                    address = "0x10",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "pitch",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "yaw",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "rotation",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorPYR",
                    name = "rotation",
                    offset = 16,
                    size = 12,
                    type = "VectorPYR",
                    what = "field"
                  } },
                is = "struct",
                metaName = "ScenarioObjectPlacement",
                name = "placement",
                offset = 0,
                size = 28,
                type = "ScenarioObjectPlacement",
                what = "field"
              }, {
                address = "0x1c",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20434",
                offset = 28,
                size = 4,
                what = "field"
              }, {
                address = "0x20",
                is = "int",
                name = "appearancePlayerIndex",
                offset = 32,
                size = 1,
                type = "char",
                what = "field"
              }, {
                address = "0x21",
                count = 3,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20493",
                offset = 33,
                size = 3,
                what = "field"
              }, {
                address = "0x24",
                count = 16,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20516",
                offset = 36,
                size = 16,
                what = "field"
              }, {
                address = "0x34",
                count = 8,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20540",
                offset = 52,
                size = 8,
                what = "field"
              }, {
                address = "0x3c",
                count = 8,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20563",
                offset = 60,
                size = 8,
                what = "field"
              }, {
                address = "0x44",
                is = "float",
                name = "bodyVitality",
                offset = 68,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x48",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "dead",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioUnitFlags",
                name = "flags",
                offset = 72,
                size = 4,
                type = "ScenarioUnitFlags",
                what = "field"
              }, {
                address = "0x4c",
                count = 8,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad20640",
                offset = 76,
                size = 8,
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioUnitProperties",
            name = "properties",
            offset = 4,
            size = 84,
            type = "ScenarioUnitProperties",
            what = "field"
          }, {
            address = "0x58",
            is = "int",
            name = "multiplayerTeamIndex",
            offset = 88,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x59",
            count = 1,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21250",
            offset = 89,
            size = 1,
            what = "field"
          }, {
            address = "0x5a",
            fields = { {
                address = "0x0",
                is = "int",
                name = "slayerDefault",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "ctfDefault",
                offset = 1,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "kingDefault",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "oddballDefault",
                offset = 3,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "unused",
                offset = 4,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "unused1",
                offset = 5,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "unused2",
                offset = 6,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "unused3",
                offset = 7,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "slayerAllowed",
                offset = 8,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "ctfAllowed",
                offset = 9,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "kingAllowed",
                offset = 10,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "oddballAllowed",
                offset = 11,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "unused4",
                offset = 12,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "unused5",
                offset = 13,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "unused6",
                offset = 14,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "unused7",
                offset = 15,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioVehicleMultiplayerSpawnFlags",
            name = "multiplayerSpawnFlags",
            offset = 90,
            size = 2,
            type = "ScenarioVehicleMultiplayerSpawnFlags",
            what = "field"
          }, {
            address = "0x5c",
            count = 28,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21339",
            offset = 92,
            size = 28,
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
    name = "vehicles",
    offset = 576,
    size = 12,
    what = "field"
  }, {
    address = "0x24c",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21495",
            offset = 16,
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
    name = "vehiclePalette",
    offset = 588,
    size = 12,
    what = "field"
  }, {
    address = "0x258",
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
        elementSize = 40,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21713",
            offset = 32,
            size = 2,
            what = "field"
          }, {
            address = "0x22",
            fields = { {
                address = "0x0",
                is = "int",
                name = "initiallyAtRest",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "obsolete",
                offset = 1,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "doesAccelerate",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioItemFlags",
            name = "miscFlags",
            offset = 34,
            size = 2,
            type = "ScenarioItemFlags",
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21806",
            offset = 37,
            size = 3,
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
    name = "equipment",
    offset = 600,
    size = 12,
    what = "field"
  }, {
    address = "0x264",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad21966",
            offset = 16,
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
    name = "equipmentPalette",
    offset = 612,
    size = 12,
    what = "field"
  }, {
    address = "0x270",
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
        elementSize = 92,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22185",
            offset = 32,
            size = 4,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22244",
            offset = 37,
            size = 3,
            what = "field"
          }, {
            address = "0x28",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22267",
            offset = 40,
            size = 16,
            what = "field"
          }, {
            address = "0x38",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22291",
            offset = 56,
            size = 8,
            what = "field"
          }, {
            address = "0x40",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22314",
            offset = 64,
            size = 8,
            what = "field"
          }, {
            address = "0x48",
            is = "int",
            name = "roundsReserved",
            offset = 72,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x4a",
            is = "int",
            name = "roundsLoaded",
            offset = 74,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x4c",
            fields = { {
                address = "0x0",
                is = "int",
                name = "initiallyAtRest",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "obsolete",
                offset = 1,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "doesAccelerate",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioItemFlags",
            name = "flags",
            offset = 76,
            size = 2,
            type = "ScenarioItemFlags",
            what = "field"
          }, {
            address = "0x4e",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22422",
            offset = 78,
            size = 2,
            what = "field"
          }, {
            address = "0x50",
            count = 12,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22445",
            offset = 80,
            size = 12,
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
    name = "weapons",
    offset = 624,
    size = 12,
    what = "field"
  }, {
    address = "0x27c",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22597",
            offset = 16,
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
    name = "weaponPalette",
    offset = 636,
    size = 12,
    what = "field"
  }, {
    address = "0x288",
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
        elementSize = 52,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "float",
            name = "initialValue",
            offset = 32,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x24",
            fields = { {
                address = "0x0",
                is = "int",
                name = "canChangeOnlyOnce",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioDeviceGroupFlags",
            name = "flags",
            offset = 36,
            size = 4,
            type = "ScenarioDeviceGroupFlags",
            what = "field"
          }, {
            address = "0x28",
            count = 12,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad22818",
            offset = 40,
            size = 12,
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
    name = "deviceGroups",
    offset = 648,
    size = 12,
    what = "field"
  }, {
    address = "0x294",
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
        elementSize = 64,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23028",
            offset = 32,
            size = 4,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23087",
            offset = 37,
            size = 3,
            what = "field"
          }, {
            address = "0x28",
            is = "int",
            name = "powerGroup",
            offset = 40,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2a",
            is = "int",
            name = "positionGroup",
            offset = 42,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2c",
            fields = { {
                address = "0x0",
                is = "int",
                name = "initiallyOpen",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "initiallyOff",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "canChangeOnlyOnce",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "positionReversed",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "notUsableFromAnySide",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioDeviceFlags",
            name = "deviceFlags",
            offset = 44,
            size = 4,
            type = "ScenarioDeviceFlags",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "int",
                name = "doesNotOperateAutomatically",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "oneSided",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "neverAppearsLocked",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "openedByMeleeAttack",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioMachineFlags",
            name = "machineFlags",
            offset = 48,
            size = 4,
            type = "ScenarioMachineFlags",
            what = "field"
          }, {
            address = "0x34",
            count = 12,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23243",
            offset = 52,
            size = 12,
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
    name = "machines",
    offset = 660,
    size = 12,
    what = "field"
  }, {
    address = "0x2a0",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23398",
            offset = 16,
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
    name = "machinePalette",
    offset = 672,
    size = 12,
    what = "field"
  }, {
    address = "0x2ac",
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
        elementSize = 64,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23614",
            offset = 32,
            size = 4,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23673",
            offset = 37,
            size = 3,
            what = "field"
          }, {
            address = "0x28",
            is = "int",
            name = "powerGroup",
            offset = 40,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2a",
            is = "int",
            name = "positionGroup",
            offset = 42,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2c",
            fields = { {
                address = "0x0",
                is = "int",
                name = "initiallyOpen",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "initiallyOff",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "canChangeOnlyOnce",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "positionReversed",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "notUsableFromAnySide",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioDeviceFlags",
            name = "deviceFlags",
            offset = 44,
            size = 4,
            type = "ScenarioDeviceFlags",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "int",
                name = "usableFromBothSides",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioControlFlags",
            name = "controlFlags",
            offset = 48,
            size = 4,
            type = "ScenarioControlFlags",
            what = "field"
          }, {
            address = "0x34",
            is = "int",
            name = "noName",
            offset = 52,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x36",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23850",
            offset = 54,
            size = 2,
            what = "field"
          }, {
            address = "0x38",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad23873",
            offset = 56,
            size = 8,
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
    name = "controls",
    offset = 684,
    size = 12,
    what = "field"
  }, {
    address = "0x2b8",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24027",
            offset = 16,
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
    name = "controlPalette",
    offset = 696,
    size = 12,
    what = "field"
  }, {
    address = "0x2c4",
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
        elementSize = 88,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            name = "bspIndices",
            offset = 32,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x22",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24274",
            offset = 34,
            size = 2,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24333",
            offset = 37,
            size = 3,
            what = "field"
          }, {
            address = "0x28",
            is = "int",
            name = "powerGroup",
            offset = 40,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2a",
            is = "int",
            name = "positionGroup",
            offset = 42,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2c",
            fields = { {
                address = "0x0",
                is = "int",
                name = "initiallyOpen",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "initiallyOff",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "canChangeOnlyOnce",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "positionReversed",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "notUsableFromAnySide",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioDeviceFlags",
            name = "deviceFlags",
            offset = 44,
            size = 4,
            type = "ScenarioDeviceFlags",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "float",
                name = "r",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "g",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "b",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "ColorRGB",
            name = "color",
            offset = 48,
            size = 12,
            type = "ColorRGB",
            what = "field"
          }, {
            address = "0x3c",
            is = "float",
            name = "intensity",
            offset = 60,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x40",
            is = "float",
            name = "falloffAngle",
            offset = 64,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x44",
            is = "float",
            name = "cutoffAngle",
            offset = 68,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x48",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24539",
            offset = 72,
            size = 16,
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
    name = "lightFixtures",
    offset = 708,
    size = 12,
    what = "field"
  }, {
    address = "0x2d0",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24709",
            offset = 16,
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
    name = "lightFixturePalette",
    offset = 720,
    size = 12,
    what = "field"
  }, {
    address = "0x2dc",
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
        elementSize = 40,
        fields = { {
            address = "0x0",
            is = "int",
            name = "type",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "name",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "automatically",
                    offset = 0,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onEasy",
                    offset = 1,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onNormal",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "onHard",
                    offset = 3,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "usePlayerAppearance",
                    offset = 4,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "ScenarioSpawnNotPlaced",
                name = "notPlaced",
                offset = 0,
                size = 2,
                type = "ScenarioSpawnNotPlaced",
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "desiredPermutation",
                offset = 2,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "x",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "y",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "z",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorXYZ",
                name = "position",
                offset = 4,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    is = "float",
                    name = "pitch",
                    offset = 0,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "yaw",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "rotation",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  } },
                is = "struct",
                metaName = "VectorPYR",
                name = "rotation",
                offset = 16,
                size = 12,
                type = "VectorPYR",
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioObjectPlacement",
            name = "placement",
            offset = 4,
            size = 28,
            type = "ScenarioObjectPlacement",
            what = "field"
          }, {
            address = "0x20",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24940",
            offset = 32,
            size = 4,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "appearancePlayerIndex",
            offset = 36,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x25",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad24999",
            offset = 37,
            size = 3,
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
    name = "soundScenery",
    offset = 732,
    size = 12,
    what = "field"
  }, {
    address = "0x2e8",
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
        elementSize = 48,
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
            name = "name",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad25168",
            offset = 16,
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
    name = "soundSceneryPalette",
    offset = 744,
    size = 12,
    what = "field"
  }, {
    address = "0x2f4",
    count = 84,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad42706",
    offset = 756,
    size = 84,
    what = "field"
  }, {
    address = "0x348",
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
        elementSize = 104,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "float",
            name = "startingHealthModifier",
            offset = 32,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x24",
            is = "float",
            name = "startingShieldModifier",
            offset = 36,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x28",
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
            name = "primaryWeapon",
            offset = 40,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x38",
            is = "int",
            name = "primaryRoundsLoaded",
            offset = 56,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x3a",
            is = "int",
            name = "primaryRoundsReserved",
            offset = 58,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x3c",
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
            name = "secondaryWeapon",
            offset = 60,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x4c",
            is = "int",
            name = "secondaryRoundsLoaded",
            offset = 76,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x4e",
            is = "int",
            name = "secondaryRoundsReserved",
            offset = 78,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x50",
            is = "int",
            name = "startingFragmentationGrenadeCount",
            offset = 80,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x51",
            is = "int",
            name = "startingPlasmaGrenadeCount",
            offset = 81,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x52",
            is = "int",
            name = "startingGrenadeType2Count",
            offset = 82,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x53",
            is = "int",
            name = "startingGrenadeType3Count",
            offset = 83,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x54",
            count = 20,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad25813",
            offset = 84,
            size = 20,
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
    name = "playerStartingProfile",
    offset = 840,
    size = 12,
    what = "field"
  }, {
    address = "0x354",
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
        elementSize = 52,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 0,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0xc",
            is = "float",
            name = "facing",
            offset = 12,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x10",
            is = "int",
            name = "teamIndex",
            offset = 16,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x12",
            is = "int",
            name = "bspIndex",
            offset = 18,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x14",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type0",
            offset = 20,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x16",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type1",
            offset = 22,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x18",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type2",
            offset = 24,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x1a",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type3",
            offset = 26,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x1c",
            count = 24,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad26193",
            offset = 28,
            size = 24,
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
    name = "playerStartingLocations",
    offset = 852,
    size = 12,
    what = "field"
  }, {
    address = "0x360",
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
        elementSize = 96,
        fields = { {
            address = "0x0",
            is = "int",
            metaName = "ScenarioTriggerVolumeType",
            name = "type",
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
            name = "pad26390",
            offset = 2,
            size = 2,
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
            count = 3,
            elementSize = 4,
            elementType = "float",
            is = "array",
            name = "parameters",
            offset = 36,
            size = 12,
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "rotationVectorForward",
            offset = 48,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x3c",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "rotationVectorUp",
            offset = 60,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x48",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "startingCorner",
            offset = 72,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x54",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "endingCornerOffset",
            offset = 84,
            size = 12,
            type = "VectorXYZ",
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
    name = "triggerVolumes",
    offset = 864,
    size = 12,
    what = "field"
  }, {
    address = "0x36c",
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
        elementSize = 64,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            name = "version",
            offset = 32,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x21",
            is = "int",
            name = "rawAnimationData",
            offset = 33,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x22",
            is = "int",
            name = "unitControlDataVersion",
            offset = 34,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x23",
            count = 1,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad26828",
            offset = 35,
            size = 1,
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "lengthOfAnimation",
            offset = 36,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x26",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad26884",
            offset = 38,
            size = 2,
            what = "field"
          }, {
            address = "0x28",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad26907",
            offset = 40,
            size = 4,
            what = "field"
          }, {
            address = "0x2c",
            fields = { {
                address = "0x0",
                is = "int",
                name = "size",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x4",
                is = "int",
                name = "flags",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "fileOffset",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                count = 0,
                elementSize = "none",
                elementType = "void",
                is = "ptr",
                name = "pointer",
                offset = 12,
                size = 4,
                what = "field"
              }, {
                address = "0x10",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "padding",
                offset = 16,
                size = 4,
                what = "field"
              } },
            is = "struct",
            metaName = "Data",
            name = "recordedAnimationEventStream",
            offset = 44,
            size = 20,
            type = "Data",
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
    name = "recordedAnimations",
    offset = 876,
    size = 12,
    what = "field"
  }, {
    address = "0x378",
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
        elementSize = 148,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 0,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0xc",
            is = "float",
            name = "facing",
            offset = 12,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x10",
            is = "int",
            metaName = "ScenarioNetgameFlagType",
            name = "type",
            offset = 16,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x12",
            is = "int",
            name = "usageId",
            offset = 18,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x14",
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
            name = "weaponGroup",
            offset = 20,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x24",
            count = 112,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad27228",
            offset = 36,
            size = 112,
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
    name = "netgameFlags",
    offset = 888,
    size = 12,
    what = "field"
  }, {
    address = "0x384",
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
        elementSize = 144,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "levitate",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioNetgameEquipmentFlags",
            name = "flags",
            offset = 0,
            size = 4,
            type = "ScenarioNetgameEquipmentFlags",
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type0",
            offset = 4,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type1",
            offset = 6,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x8",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type2",
            offset = 8,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0xa",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type3",
            offset = 10,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "teamIndex",
            offset = 12,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0xe",
            is = "int",
            name = "spawnTime",
            offset = 14,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x10",
            is = "int",
            name = "unknownFfffffff",
            offset = 16,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x14",
            count = 44,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad27615",
            offset = 20,
            size = 44,
            what = "field"
          }, {
            address = "0x40",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 64,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x4c",
            is = "float",
            name = "facing",
            offset = 76,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x50",
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
            name = "itemCollection",
            offset = 80,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x60",
            count = 48,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad27715",
            offset = 96,
            size = 48,
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
    name = "netgameEquipment",
    offset = 900,
    size = 12,
    what = "field"
  }, {
    address = "0x390",
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
        elementSize = 204,
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "noGrenades",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "plasmaGrenadesOnly",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "type2GrenadesOnly",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "type3GrenadesOnly",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioStartingEquipmentFlags",
            name = "flags",
            offset = 0,
            size = 4,
            type = "ScenarioStartingEquipmentFlags",
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type0",
            offset = 4,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type1",
            offset = 6,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x8",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type2",
            offset = 8,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0xa",
            is = "int",
            metaName = "ScenarioSpawnType",
            name = "type3",
            offset = 10,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0xc",
            count = 48,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad28031",
            offset = 12,
            size = 48,
            what = "field"
          }, {
            address = "0x3c",
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
            name = "itemCollection1",
            offset = 60,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x4c",
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
            name = "itemCollection2",
            offset = 76,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x5c",
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
            name = "itemCollection3",
            offset = 92,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x6c",
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
            name = "itemCollection4",
            offset = 108,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x7c",
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
            name = "itemCollection5",
            offset = 124,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x8c",
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
            name = "itemCollection6",
            offset = 140,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x9c",
            count = 48,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad28271",
            offset = 156,
            size = 48,
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
    name = "startingEquipment",
    offset = 912,
    size = 12,
    what = "field"
  }, {
    address = "0x39c",
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
        elementSize = 8,
        fields = { {
            address = "0x0",
            is = "int",
            name = "triggerVolume",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "source",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "destination",
            offset = 4,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            name = "unknown",
            offset = 6,
            size = 2,
            type = "word",
            unsigned = true,
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
    name = "bspSwitchTriggerVolumes",
    offset = 924,
    size = 12,
    what = "field"
  }, {
    address = "0x3a8",
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
        elementSize = 16,
        fields = { {
            address = "0x0",
            is = "int",
            name = "decalType",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "yaw",
            offset = 2,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x3",
            is = "int",
            name = "pitch",
            offset = 3,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 4,
            size = 12,
            type = "VectorXYZ",
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
    name = "decals",
    offset = 936,
    size = 12,
    what = "field"
  }, {
    address = "0x3b4",
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
        elementSize = 16,
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
            name = "reference",
            offset = 0,
            size = 16,
            type = "TagReference",
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
    name = "decalPalette",
    offset = 948,
    size = 12,
    what = "field"
  }, {
    address = "0x3c0",
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
        elementSize = 48,
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
            name = "reference",
            offset = 0,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x10",
            count = 32,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad29032",
            offset = 16,
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
    name = "detailObjectCollectionPalette",
    offset = 960,
    size = 12,
    what = "field"
  }, {
    address = "0x3cc",
    count = 84,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad44135",
    offset = 972,
    size = 84,
    what = "field"
  }, {
    address = "0x420",
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
        elementSize = 16,
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
            name = "reference",
            offset = 0,
            size = 16,
            type = "TagReference",
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
    name = "actorPalette",
    offset = 1056,
    size = 12,
    what = "field"
  }, {
    address = "0x42c",
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
        elementSize = 176,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            fields = { {
                address = "0x0",
                is = "int",
                name = "notInitiallyCreated",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "respawnEnabled",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "initiallyBlind",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "initiallyDeaf",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "initiallyBraindead",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "3dFiringPositions",
                offset = 5,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "manualBspIndexSpecified",
                offset = 6,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioEncounterFlags",
            name = "flags",
            offset = 32,
            size = 4,
            type = "ScenarioEncounterFlags",
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            metaName = "ScenarioTeamIndex",
            name = "teamIndex",
            offset = 36,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x26",
            is = "int",
            name = "one",
            offset = 38,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x28",
            is = "int",
            metaName = "ScenarioSearchBehavior",
            name = "searchBehavior",
            offset = 40,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x2a",
            is = "int",
            name = "manualBspIndex",
            offset = 42,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2c",
            count = 2,
            elementSize = 4,
            elementType = "float",
            is = "array",
            name = "respawnDelay",
            offset = 44,
            size = 8,
            what = "field"
          }, {
            address = "0x34",
            count = 74,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad32460",
            offset = 52,
            size = 74,
            what = "field"
          }, {
            address = "0x7e",
            is = "int",
            name = "precomputedBspIndex",
            offset = 126,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x80",
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
                elementSize = 232,
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
                    name = "name",
                    offset = 0,
                    size = 32,
                    type = "String32",
                    what = "field"
                  }, {
                    address = "0x20",
                    is = "int",
                    name = "actorType",
                    offset = 32,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x22",
                    is = "int",
                    name = "platoon",
                    offset = 34,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x24",
                    is = "int",
                    metaName = "ScenarioReturnState",
                    name = "initialState",
                    offset = 36,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x26",
                    is = "int",
                    metaName = "ScenarioReturnState",
                    name = "returnState",
                    offset = 38,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x28",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "unused",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "neverSearch",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "startTimerImmediately",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "noTimerDelayForever",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "magicSightAfterTimer",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "automaticMigration",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadFlags",
                    name = "flags",
                    offset = 40,
                    size = 4,
                    type = "ScenarioSquadFlags",
                    what = "field"
                  }, {
                    address = "0x2c",
                    is = "int",
                    metaName = "ScenarioUniqueLeaderType",
                    name = "uniqueLeaderType",
                    offset = 44,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x2e",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad30346",
                    offset = 46,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x30",
                    count = 28,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad30369",
                    offset = 48,
                    size = 28,
                    what = "field"
                  }, {
                    address = "0x4c",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad30393",
                    offset = 76,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x4e",
                    is = "int",
                    name = "maneuverToSquad",
                    offset = 78,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x50",
                    is = "float",
                    name = "squadDelayTime",
                    offset = 80,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x54",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "attacking",
                    offset = 84,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x58",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "attackingSearch",
                    offset = 88,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x5c",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "attackingGuard",
                    offset = 92,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x60",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "defending",
                    offset = 96,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x64",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "defendingSearch",
                    offset = 100,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x68",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "defendingGuard",
                    offset = 104,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x6c",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "a",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "b",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "c",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "d",
                        offset = 3,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "e",
                        offset = 4,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "f",
                        offset = 5,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "g",
                        offset = 6,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "h",
                        offset = 7,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "i",
                        offset = 8,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "j",
                        offset = 9,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "k",
                        offset = 10,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "l",
                        offset = 11,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "m",
                        offset = 12,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "n",
                        offset = 13,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "o",
                        offset = 14,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x1",
                        is = "int",
                        name = "p",
                        offset = 15,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "q",
                        offset = 16,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "r",
                        offset = 17,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "s",
                        offset = 18,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "t",
                        offset = 19,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "u",
                        offset = 20,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "v",
                        offset = 21,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "w",
                        offset = 22,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x2",
                        is = "int",
                        name = "x",
                        offset = 23,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "y",
                        offset = 24,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x3",
                        is = "int",
                        name = "z",
                        offset = 25,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioSquadAttacking",
                    name = "pursuing",
                    offset = 108,
                    size = 4,
                    type = "ScenarioSquadAttacking",
                    what = "field"
                  }, {
                    address = "0x70",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad30767",
                    offset = 112,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x74",
                    count = 8,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad30790",
                    offset = 116,
                    size = 8,
                    what = "field"
                  }, {
                    address = "0x7c",
                    is = "int",
                    name = "normalDiffCount",
                    offset = 124,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x7e",
                    is = "int",
                    name = "insaneDiffCount",
                    offset = 126,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x80",
                    is = "int",
                    metaName = "ScenarioMajorUpgrade",
                    name = "majorUpgrade",
                    offset = 128,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x82",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad30915",
                    offset = 130,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x84",
                    is = "int",
                    name = "respawnMinActors",
                    offset = 132,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x86",
                    is = "int",
                    name = "respawnMaxActors",
                    offset = 134,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x88",
                    is = "int",
                    name = "respawnTotal",
                    offset = 136,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x8a",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31029",
                    offset = 138,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x8c",
                    count = 2,
                    elementSize = 4,
                    elementType = "float",
                    is = "array",
                    name = "respawnDelay",
                    offset = 140,
                    size = 8,
                    what = "field"
                  }, {
                    address = "0x94",
                    count = 48,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31080",
                    offset = 148,
                    size = 48,
                    what = "field"
                  }, {
                    address = "0xc4",
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
                                is = "float",
                                name = "x",
                                offset = 0,
                                size = 4,
                                type = "float",
                                what = "field"
                              }, {
                                address = "0x4",
                                is = "float",
                                name = "y",
                                offset = 4,
                                size = 4,
                                type = "float",
                                what = "field"
                              }, {
                                address = "0x8",
                                is = "float",
                                name = "z",
                                offset = 8,
                                size = 4,
                                type = "float",
                                what = "field"
                              } },
                            is = "struct",
                            metaName = "VectorXYZ",
                            name = "position",
                            offset = 0,
                            size = 12,
                            type = "VectorXYZ",
                            what = "field"
                          }, {
                            address = "0xc",
                            is = "float",
                            name = "facing",
                            offset = 12,
                            size = 4,
                            type = "float",
                            what = "field"
                          }, {
                            address = "0x10",
                            is = "float",
                            name = "weight",
                            offset = 16,
                            size = 4,
                            type = "float",
                            what = "field"
                          }, {
                            address = "0x14",
                            count = 2,
                            elementSize = 4,
                            elementType = "float",
                            is = "array",
                            name = "time",
                            offset = 20,
                            size = 8,
                            what = "field"
                          }, {
                            address = "0x1c",
                            is = "int",
                            name = "animation",
                            offset = 28,
                            size = 2,
                            type = "word",
                            unsigned = true,
                            what = "field"
                          }, {
                            address = "0x1e",
                            is = "int",
                            name = "sequenceId",
                            offset = 30,
                            size = 1,
                            type = "char",
                            what = "field"
                          }, {
                            address = "0x1f",
                            count = 1,
                            elementSize = 1,
                            elementType = "char",
                            is = "array",
                            name = "pad29477",
                            offset = 31,
                            size = 1,
                            what = "field"
                          }, {
                            address = "0x20",
                            count = 8,
                            elementSize = 1,
                            elementType = "char",
                            is = "array",
                            name = "pad29500",
                            offset = 32,
                            size = 8,
                            what = "field"
                          }, {
                            address = "0x28",
                            is = "int",
                            name = "clusterIndex",
                            offset = 40,
                            size = 2,
                            type = "word",
                            unsigned = true,
                            what = "field"
                          }, {
                            address = "0x2a",
                            count = 34,
                            elementSize = 1,
                            elementType = "char",
                            is = "array",
                            name = "pad29551",
                            offset = 42,
                            size = 34,
                            what = "field"
                          }, {
                            address = "0x4c",
                            is = "int",
                            name = "surfaceIndex",
                            offset = 76,
                            size = 4,
                            type = "dword",
                            unsigned = true,
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
                    name = "movePositions",
                    offset = 196,
                    size = 12,
                    what = "field"
                  }, {
                    address = "0xd0",
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
                        elementSize = 28,
                        fields = { {
                            address = "0x0",
                            fields = { {
                                address = "0x0",
                                is = "float",
                                name = "x",
                                offset = 0,
                                size = 4,
                                type = "float",
                                what = "field"
                              }, {
                                address = "0x4",
                                is = "float",
                                name = "y",
                                offset = 4,
                                size = 4,
                                type = "float",
                                what = "field"
                              }, {
                                address = "0x8",
                                is = "float",
                                name = "z",
                                offset = 8,
                                size = 4,
                                type = "float",
                                what = "field"
                              } },
                            is = "struct",
                            metaName = "VectorXYZ",
                            name = "position",
                            offset = 0,
                            size = 12,
                            type = "VectorXYZ",
                            what = "field"
                          }, {
                            address = "0xc",
                            is = "float",
                            name = "facing",
                            offset = 12,
                            size = 4,
                            type = "float",
                            what = "field"
                          }, {
                            address = "0x10",
                            is = "int",
                            name = "clusterIndex",
                            offset = 16,
                            size = 2,
                            type = "word",
                            unsigned = true,
                            what = "field"
                          }, {
                            address = "0x12",
                            is = "int",
                            name = "sequenceId",
                            offset = 18,
                            size = 1,
                            type = "char",
                            what = "field"
                          }, {
                            address = "0x13",
                            fields = { {
                                address = "0x0",
                                is = "int",
                                name = "required",
                                offset = 0,
                                size = 1,
                                type = "byte",
                                unsigned = true,
                                what = "bitfield"
                              } },
                            is = "struct",
                            metaName = "ScenarioActorStartingLocationFlags",
                            name = "flags",
                            offset = 19,
                            size = 1,
                            type = "ScenarioActorStartingLocationFlags",
                            what = "field"
                          }, {
                            address = "0x14",
                            is = "int",
                            metaName = "ScenarioReturnState",
                            name = "returnState",
                            offset = 20,
                            size = 2,
                            type = "short",
                            what = "field"
                          }, {
                            address = "0x16",
                            is = "int",
                            metaName = "ScenarioReturnState",
                            name = "initialState",
                            offset = 22,
                            size = 2,
                            type = "short",
                            what = "field"
                          }, {
                            address = "0x18",
                            is = "int",
                            name = "actorType",
                            offset = 24,
                            size = 2,
                            type = "word",
                            unsigned = true,
                            what = "field"
                          }, {
                            address = "0x1a",
                            is = "int",
                            name = "commandList",
                            offset = 26,
                            size = 2,
                            type = "word",
                            unsigned = true,
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
                    name = "startingLocations",
                    offset = 208,
                    size = 12,
                    what = "field"
                  }, {
                    address = "0xdc",
                    count = 12,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31353",
                    offset = 220,
                    size = 12,
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
            name = "squads",
            offset = 128,
            size = 12,
            what = "field"
          }, {
            address = "0x8c",
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
                elementSize = 172,
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
                    name = "name",
                    offset = 0,
                    size = 32,
                    type = "String32",
                    what = "field"
                  }, {
                    address = "0x20",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "fleeWhenManeuvering",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "sayAdvancingWhenManeuver",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "startInDefendingState",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioPlatoonFlags",
                    name = "flags",
                    offset = 32,
                    size = 4,
                    type = "ScenarioPlatoonFlags",
                    what = "field"
                  }, {
                    address = "0x24",
                    count = 12,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31526",
                    offset = 36,
                    size = 12,
                    what = "field"
                  }, {
                    address = "0x30",
                    is = "int",
                    metaName = "ScenarioChangeAttackingDefendingStateWhen",
                    name = "changeAttackingDefendingStateWhen",
                    offset = 48,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x32",
                    is = "int",
                    name = "happensTo",
                    offset = 50,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x34",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31660",
                    offset = 52,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x38",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31683",
                    offset = 56,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x3c",
                    is = "int",
                    metaName = "ScenarioChangeAttackingDefendingStateWhen",
                    name = "maneuverWhen",
                    offset = 60,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x3e",
                    is = "int",
                    name = "happensTo1",
                    offset = 62,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x40",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31794",
                    offset = 64,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x44",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31817",
                    offset = 68,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x48",
                    count = 64,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31840",
                    offset = 72,
                    size = 64,
                    what = "field"
                  }, {
                    address = "0x88",
                    count = 36,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad31864",
                    offset = 136,
                    size = 36,
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
            name = "platoons",
            offset = 140,
            size = 12,
            what = "field"
          }, {
            address = "0x98",
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
                elementSize = 24,
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "x",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "y",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "z",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorXYZ",
                    name = "position",
                    offset = 0,
                    size = 12,
                    type = "VectorXYZ",
                    what = "field"
                  }, {
                    address = "0xc",
                    is = "int",
                    metaName = "ScenarioGroupIndex",
                    name = "groupIndex",
                    offset = 12,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0xe",
                    is = "int",
                    name = "clusterIndex",
                    offset = 14,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x10",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad32085",
                    offset = 16,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x14",
                    is = "int",
                    name = "surfaceIndex",
                    offset = 20,
                    size = 4,
                    type = "dword",
                    unsigned = true,
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
            name = "firingPositions",
            offset = 152,
            size = 12,
            what = "field"
          }, {
            address = "0xa4",
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
                elementSize = 52,
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "x",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "y",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "z",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorXYZ",
                    name = "position",
                    offset = 0,
                    size = 12,
                    type = "VectorXYZ",
                    what = "field"
                  }, {
                    address = "0xc",
                    is = "float",
                    name = "facing",
                    offset = 12,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x10",
                    is = "int",
                    name = "teamIndex",
                    offset = 16,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x12",
                    is = "int",
                    name = "bspIndex",
                    offset = 18,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x14",
                    is = "int",
                    metaName = "ScenarioSpawnType",
                    name = "type0",
                    offset = 20,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x16",
                    is = "int",
                    metaName = "ScenarioSpawnType",
                    name = "type1",
                    offset = 22,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x18",
                    is = "int",
                    metaName = "ScenarioSpawnType",
                    name = "type2",
                    offset = 24,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x1a",
                    is = "int",
                    metaName = "ScenarioSpawnType",
                    name = "type3",
                    offset = 26,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x1c",
                    count = 24,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad26193",
                    offset = 28,
                    size = 24,
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
            name = "playerStartingLocations",
            offset = 164,
            size = 12,
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
    name = "encounters",
    offset = 1068,
    size = 12,
    what = "field"
  }, {
    address = "0x438",
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
        elementSize = 96,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            fields = { {
                address = "0x0",
                is = "int",
                name = "allowInitiative",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "allowTargeting",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "disableLooking",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "disableCommunication",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "disableFallingDamage",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "manualBspIndex",
                offset = 5,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioCommandListFlags",
            name = "flags",
            offset = 32,
            size = 4,
            type = "ScenarioCommandListFlags",
            what = "field"
          }, {
            address = "0x24",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad33737",
            offset = 36,
            size = 8,
            what = "field"
          }, {
            address = "0x2c",
            is = "int",
            name = "manualBspIndex",
            offset = 44,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2e",
            is = "int",
            name = "precomputedBspIndex",
            offset = 46,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x30",
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
                elementSize = 32,
                fields = { {
                    address = "0x0",
                    is = "int",
                    metaName = "ScenarioAtomType",
                    name = "atomType",
                    offset = 0,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "atomModifier",
                    offset = 2,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "parameter1",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "float",
                    name = "parameter2",
                    offset = 8,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0xc",
                    is = "int",
                    name = "point1",
                    offset = 12,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0xe",
                    is = "int",
                    name = "point2",
                    offset = 14,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x10",
                    is = "int",
                    name = "animation",
                    offset = 16,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x12",
                    is = "int",
                    name = "script",
                    offset = 18,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x14",
                    is = "int",
                    name = "recording",
                    offset = 20,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x16",
                    is = "int",
                    name = "command",
                    offset = 22,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x18",
                    is = "int",
                    name = "objectName",
                    offset = 24,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x1a",
                    count = 6,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad33363",
                    offset = 26,
                    size = 6,
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
            name = "commands",
            offset = 48,
            size = 12,
            what = "field"
          }, {
            address = "0x3c",
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
                elementSize = 20,
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "float",
                        name = "x",
                        offset = 0,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x4",
                        is = "float",
                        name = "y",
                        offset = 4,
                        size = 4,
                        type = "float",
                        what = "field"
                      }, {
                        address = "0x8",
                        is = "float",
                        name = "z",
                        offset = 8,
                        size = 4,
                        type = "float",
                        what = "field"
                      } },
                    is = "struct",
                    metaName = "VectorXYZ",
                    name = "position",
                    offset = 0,
                    size = 12,
                    type = "VectorXYZ",
                    what = "field"
                  }, {
                    address = "0xc",
                    is = "int",
                    name = "surfaceIndex",
                    offset = 12,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x10",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad33544",
                    offset = 16,
                    size = 4,
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
            name = "points",
            offset = 60,
            size = 12,
            what = "field"
          }, {
            address = "0x48",
            count = 24,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad34044",
            offset = 72,
            size = 24,
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
    name = "commandLists",
    offset = 1080,
    size = 12,
    what = "field"
  }, {
    address = "0x444",
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
        elementSize = 60,
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
            name = "animationName",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
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
            name = "animationGraph",
            offset = 32,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x30",
            count = 12,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad34253",
            offset = 48,
            size = 12,
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
    name = "aiAnimationReferences",
    offset = 1092,
    size = 12,
    what = "field"
  }, {
    address = "0x450",
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
        elementSize = 40,
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
            name = "scriptName",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad34440",
            offset = 32,
            size = 8,
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
    name = "aiScriptReferences",
    offset = 1104,
    size = 12,
    what = "field"
  }, {
    address = "0x45c",
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
        elementSize = 40,
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
            name = "recordingName",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad34626",
            offset = 32,
            size = 8,
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
    name = "aiRecordingReferences",
    offset = 1116,
    size = 12,
    what = "field"
  }, {
    address = "0x468",
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
        elementSize = 116,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            fields = { {
                address = "0x0",
                is = "int",
                name = "stopIfDeath",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "stopIfDamaged",
                offset = 1,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "stopIfVisibleEnemy",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "stopIfAlertedToEnemy",
                offset = 3,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "playerMustBeVisible",
                offset = 4,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "stopOtherActions",
                offset = 5,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "keepTryingToPlay",
                offset = 6,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "playerMustBeLooking",
                offset = 7,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioAIConversationFlags",
            name = "flags",
            offset = 32,
            size = 2,
            type = "ScenarioAIConversationFlags",
            what = "field"
          }, {
            address = "0x22",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad35849",
            offset = 34,
            size = 2,
            what = "field"
          }, {
            address = "0x24",
            is = "float",
            name = "triggerDistance",
            offset = 36,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x28",
            is = "float",
            name = "runToPlayerDist",
            offset = 40,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x2c",
            count = 36,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad35930",
            offset = 44,
            size = 36,
            what = "field"
          }, {
            address = "0x50",
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
                elementSize = 84,
                fields = { {
                    address = "0x0",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad34794",
                    offset = 0,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x2",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "optional",
                        offset = 0,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "hasAlternate",
                        offset = 1,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "isAlternate",
                        offset = 2,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioAIConversationParticipantFlags",
                    name = "flags",
                    offset = 2,
                    size = 2,
                    type = "ScenarioAIConversationParticipantFlags",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "int",
                    metaName = "ScenarioSelectionType",
                    name = "selectionType",
                    offset = 4,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x6",
                    is = "int",
                    metaName = "ActorType",
                    name = "actorType",
                    offset = 6,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "int",
                    name = "useThisObject",
                    offset = 8,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0xa",
                    is = "int",
                    name = "setNewName",
                    offset = 10,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0xc",
                    count = 12,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad34992",
                    offset = 12,
                    size = 12,
                    what = "field"
                  }, {
                    address = "0x18",
                    count = 6,
                    elementSize = 2,
                    elementType = "word",
                    is = "array",
                    name = "variantNumbers",
                    offset = 24,
                    size = 12,
                    what = "field"
                  }, {
                    address = "0x24",
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
                    name = "encounterName",
                    offset = 36,
                    size = 32,
                    type = "String32",
                    what = "field"
                  }, {
                    address = "0x44",
                    is = "int",
                    name = "encounterIndex",
                    offset = 68,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x48",
                    count = 12,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad35108",
                    offset = 72,
                    size = 12,
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
            name = "participants",
            offset = 80,
            size = 12,
            what = "field"
          }, {
            address = "0x5c",
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
                elementSize = 124,
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "addresseeLookAtSpeaker",
                        offset = 0,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "everyoneLookAtSpeaker",
                        offset = 1,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "everyoneLookAtAddressee",
                        offset = 2,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "waitAfterUntilToldToAdvance",
                        offset = 3,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "waitUntilSpeakerNearby",
                        offset = 4,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "waitUntilEveryoneNearby",
                        offset = 5,
                        size = 2,
                        type = "word",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ScenarioAIConversationLineFlags",
                    name = "flags",
                    offset = 0,
                    size = 2,
                    type = "ScenarioAIConversationLineFlags",
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    name = "participant",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "int",
                    metaName = "ScenarioAddressee",
                    name = "addressee",
                    offset = 4,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x6",
                    is = "int",
                    name = "addresseeParticipant",
                    offset = 6,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x8",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad35418",
                    offset = 8,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0xc",
                    is = "float",
                    name = "lineDelayTime",
                    offset = 12,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x10",
                    count = 12,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad35468",
                    offset = 16,
                    size = 12,
                    what = "field"
                  }, {
                    address = "0x1c",
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
                    name = "variant1",
                    offset = 28,
                    size = 16,
                    type = "TagReference",
                    what = "field"
                  }, {
                    address = "0x2c",
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
                    name = "variant2",
                    offset = 44,
                    size = 16,
                    type = "TagReference",
                    what = "field"
                  }, {
                    address = "0x3c",
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
                    name = "variant3",
                    offset = 60,
                    size = 16,
                    type = "TagReference",
                    what = "field"
                  }, {
                    address = "0x4c",
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
                    name = "variant4",
                    offset = 76,
                    size = 16,
                    type = "TagReference",
                    what = "field"
                  }, {
                    address = "0x5c",
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
                    name = "variant5",
                    offset = 92,
                    size = 16,
                    type = "TagReference",
                    what = "field"
                  }, {
                    address = "0x6c",
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
                    name = "variant6",
                    offset = 108,
                    size = 16,
                    type = "TagReference",
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
            name = "lines",
            offset = 92,
            size = 12,
            what = "field"
          }, {
            address = "0x68",
            count = 12,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad36198",
            offset = 104,
            size = 12,
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
    name = "aiConversations",
    offset = 1128,
    size = 12,
    what = "field"
  }, {
    address = "0x474",
    fields = { {
        address = "0x0",
        is = "int",
        name = "size",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "flags",
        offset = 4,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "fileOffset",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        count = 0,
        elementSize = "none",
        elementType = "void",
        is = "ptr",
        name = "pointer",
        offset = 12,
        size = 4,
        what = "field"
      }, {
        address = "0x10",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "padding",
        offset = 16,
        size = 4,
        what = "field"
      } },
    is = "struct",
    metaName = "Data",
    name = "scriptSyntaxData",
    offset = 1140,
    size = 20,
    type = "Data",
    what = "field"
  }, {
    address = "0x488",
    fields = { {
        address = "0x0",
        is = "int",
        name = "size",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "flags",
        offset = 4,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x8",
        is = "int",
        name = "fileOffset",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0xc",
        count = 0,
        elementSize = "none",
        elementType = "void",
        is = "ptr",
        name = "pointer",
        offset = 12,
        size = 4,
        what = "field"
      }, {
        address = "0x10",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "padding",
        offset = 16,
        size = 4,
        what = "field"
      } },
    is = "struct",
    metaName = "Data",
    name = "scriptStringData",
    offset = 1160,
    size = 20,
    type = "Data",
    what = "field"
  }, {
    address = "0x49c",
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
        elementSize = 92,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            metaName = "ScenarioScriptType",
            name = "scriptType",
            offset = 32,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x22",
            is = "int",
            metaName = "ScenarioScriptValueType",
            name = "returnType",
            offset = 34,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x24",
            is = "int",
            name = "rootExpressionIndex",
            offset = 36,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x28",
            count = 40,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad36677",
            offset = 40,
            size = 40,
            what = "field"
          }, {
            address = "0x50",
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
                    offset = 0,
                    size = 32,
                    type = "String32",
                    what = "field"
                  }, {
                    address = "0x20",
                    is = "int",
                    metaName = "ScenarioScriptValueType",
                    name = "returnType",
                    offset = 32,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x22",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad36406",
                    offset = 34,
                    size = 2,
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
            name = "parameters",
            offset = 80,
            size = 12,
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
    name = "scripts",
    offset = 1180,
    size = 12,
    what = "field"
  }, {
    address = "0x4a8",
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
        elementSize = 92,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            is = "int",
            metaName = "ScenarioScriptValueType",
            name = "type",
            offset = 32,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x22",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad36969",
            offset = 34,
            size = 2,
            what = "field"
          }, {
            address = "0x24",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad36992",
            offset = 36,
            size = 4,
            what = "field"
          }, {
            address = "0x28",
            is = "int",
            name = "initializationExpressionIndex",
            offset = 40,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2c",
            count = 48,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad37061",
            offset = 44,
            size = 48,
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
    name = "globals",
    offset = 1192,
    size = 12,
    what = "field"
  }, {
    address = "0x4b4",
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
        elementSize = 40,
        fields = { {
            address = "0x0",
            count = 24,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad37186",
            offset = 0,
            size = 24,
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
            name = "reference",
            offset = 24,
            size = 16,
            type = "TagReference",
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
    name = "references",
    offset = 1204,
    size = 12,
    what = "field"
  }, {
    address = "0x4c0",
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
        elementSize = 52,
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
            name = "name",
            offset = 0,
            size = 32,
            type = "String32",
            what = "field"
          }, {
            address = "0x20",
            fields = { {
                address = "0x0",
                is = "int",
                name = "size",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x4",
                is = "int",
                name = "flags",
                offset = 4,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "fileOffset",
                offset = 8,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0xc",
                count = 0,
                elementSize = "none",
                elementType = "void",
                is = "ptr",
                name = "pointer",
                offset = 12,
                size = 4,
                what = "field"
              }, {
                address = "0x10",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "padding",
                offset = 16,
                size = 4,
                what = "field"
              } },
            is = "struct",
            metaName = "Data",
            name = "source",
            offset = 32,
            size = 20,
            type = "Data",
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
    name = "sourceFiles",
    offset = 1216,
    size = 12,
    what = "field"
  }, {
    address = "0x4cc",
    count = 24,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad45517",
    offset = 1228,
    size = 24,
    what = "field"
  }, {
    address = "0x4e4",
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
        elementSize = 92,
        fields = { {
            address = "0x0",
            is = "int",
            name = "unknown",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
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
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 36,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "float",
                name = "pitch",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "yaw",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorPY",
            name = "facing",
            offset = 48,
            size = 8,
            type = "VectorPY",
            what = "field"
          }, {
            address = "0x38",
            count = 36,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad37580",
            offset = 56,
            size = 36,
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
    name = "cutsceneFlags",
    offset = 1252,
    size = 12,
    what = "field"
  }, {
    address = "0x4f0",
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
        elementSize = 104,
        fields = { {
            address = "0x0",
            is = "int",
            name = "unknown",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
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
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad37768",
            offset = 36,
            size = 4,
            what = "field"
          }, {
            address = "0x28",
            fields = { {
                address = "0x0",
                is = "float",
                name = "x",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "y",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "z",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorXYZ",
            name = "position",
            offset = 40,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x34",
            fields = { {
                address = "0x0",
                is = "float",
                name = "pitch",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "yaw",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "rotation",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorPYR",
            name = "orientation",
            offset = 52,
            size = 12,
            type = "VectorPYR",
            what = "field"
          }, {
            address = "0x40",
            is = "float",
            name = "fieldOfView",
            offset = 64,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x44",
            count = 36,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad37867",
            offset = 68,
            size = 36,
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
    name = "cutsceneCameraPoints",
    offset = 1264,
    size = 12,
    what = "field"
  }, {
    address = "0x4fc",
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
        elementSize = 96,
        fields = { {
            address = "0x0",
            is = "int",
            name = "unknown",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
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
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad38064",
            offset = 36,
            size = 4,
            what = "field"
          }, {
            address = "0x28",
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
            name = "textBounds",
            offset = 40,
            size = 8,
            type = "Rectangle2D",
            what = "field"
          }, {
            address = "0x30",
            is = "int",
            name = "stringIndex",
            offset = 48,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x32",
            is = "int",
            metaName = "ScenarioTextStyle",
            name = "textStyle",
            offset = 50,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x34",
            is = "int",
            metaName = "ScenarioJustification",
            name = "justification",
            offset = 52,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x36",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad38218",
            offset = 54,
            size = 2,
            what = "field"
          }, {
            address = "0x38",
            fields = { {
                address = "0x0",
                is = "int",
                name = "wrapHorizontally",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "wrapVertically",
                offset = 1,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "centerVertically",
                offset = 2,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "bottomJustify",
                offset = 3,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ScenarioTextFlags",
            name = "textFlags",
            offset = 56,
            size = 4,
            type = "ScenarioTextFlags",
            what = "field"
          }, {
            address = "0x3c",
            is = "int",
            name = "textColor",
            offset = 60,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x40",
            is = "int",
            name = "shadowColor",
            offset = 64,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x44",
            is = "float",
            name = "fadeInTime",
            offset = 68,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x48",
            is = "float",
            name = "upTime",
            offset = 72,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4c",
            is = "float",
            name = "fadeOutTime",
            offset = 76,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x50",
            count = 16,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad38403",
            offset = 80,
            size = 16,
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
    name = "cutsceneTitles",
    offset = 1276,
    size = 12,
    what = "field"
  }, {
    address = "0x508",
    count = 108,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad45912",
    offset = 1288,
    size = 108,
    what = "field"
  }, {
    address = "0x574",
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
    name = "customObjectNames",
    offset = 1396,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x584",
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
    name = "ingameHelpText",
    offset = 1412,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x594",
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
    name = "hudMessages",
    offset = 1428,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x5a4",
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
        elementSize = 32,
        fields = { {
            address = "0x0",
            is = "int",
            name = "bspStart",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "bspSize",
            offset = 4,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x8",
            is = "int",
            name = "bspAddress",
            offset = 8,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0xc",
            count = 4,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad38609",
            offset = 12,
            size = 4,
            what = "field"
          }, {
            address = "0x10",
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
            name = "structureBsp",
            offset = 16,
            size = 16,
            type = "TagReference",
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
    name = "structureBsps",
    offset = 1444,
    size = 12,
    what = "field"
  } }
