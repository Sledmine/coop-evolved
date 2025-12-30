return { {
    address = "0x0",
    fields = { {
        address = "0x0",
        fields = { {
            address = "0x0",
            is = "int",
            metaName = "ObjectType",
            name = "type",
            offset = 0,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x2",
            fields = { {
                address = "0x0",
                is = "int",
                name = "doesNotCastShadow",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "transparentSelfOcclusion",
                offset = 1,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "brighterThanItShouldBe",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "notAPathfindingObstacle",
                offset = 3,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "extensionOfParent",
                offset = 4,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "castShadowByDefault",
                offset = 5,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "doesNotHaveAnniversaryGeometry",
                offset = 6,
                size = 2,
                type = "word",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ObjectFlags",
            name = "flags",
            offset = 2,
            size = 2,
            type = "ObjectFlags",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "boundingRadius",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
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
            name = "boundingOffset",
            offset = 8,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x14",
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
            name = "originOffset",
            offset = 20,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x20",
            is = "float",
            name = "accelerationScale",
            offset = 32,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x24",
            fields = { {
                address = "0x0",
                is = "int",
                name = "functionsControlColorScale",
                offset = 0,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ObjectRuntimeFlags",
            name = "runtimeFlags",
            offset = 36,
            size = 4,
            type = "ObjectRuntimeFlags",
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
            name = "model",
            offset = 40,
            size = 16,
            type = "TagReference",
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
            name = "animationGraph",
            offset = 56,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x48",
            count = 40,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad5279",
            offset = 72,
            size = 40,
            what = "field"
          }, {
            address = "0x70",
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
            name = "collisionModel",
            offset = 112,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x80",
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
            name = "physics",
            offset = 128,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0x90",
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
            name = "modifierShader",
            offset = 144,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0xa0",
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
            name = "creationEffect",
            offset = 160,
            size = 16,
            type = "TagReference",
            what = "field"
          }, {
            address = "0xb0",
            count = 84,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad5430",
            offset = 176,
            size = 84,
            what = "field"
          }, {
            address = "0x104",
            is = "float",
            name = "renderBoundingRadius",
            offset = 260,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x108",
            is = "int",
            metaName = "ObjectFunctionIn",
            name = "aIn",
            offset = 264,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x10a",
            is = "int",
            metaName = "ObjectFunctionIn",
            name = "bIn",
            offset = 266,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x10c",
            is = "int",
            metaName = "ObjectFunctionIn",
            name = "cIn",
            offset = 268,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x10e",
            is = "int",
            metaName = "ObjectFunctionIn",
            name = "dIn",
            offset = 270,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x110",
            count = 44,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad5595",
            offset = 272,
            size = 44,
            what = "field"
          }, {
            address = "0x13c",
            is = "int",
            name = "hudTextMessageIndex",
            offset = 316,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x13e",
            is = "int",
            name = "forcedShaderPermutationIndex",
            offset = 318,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x140",
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
                    name = "type",
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
                    name = "marker",
                    offset = 16,
                    size = 32,
                    type = "String32",
                    what = "field"
                  }, {
                    address = "0x30",
                    is = "int",
                    metaName = "FunctionOut",
                    name = "primaryScale",
                    offset = 48,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x32",
                    is = "int",
                    metaName = "FunctionOut",
                    name = "secondaryScale",
                    offset = 50,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x34",
                    is = "int",
                    metaName = "FunctionNameNullable",
                    name = "changeColor",
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
                    name = "pad3396",
                    offset = 54,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x38",
                    count = 16,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad3418",
                    offset = 56,
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
            name = "attachments",
            offset = 320,
            size = 12,
            what = "field"
          }, {
            address = "0x14c",
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
                    name = "reference",
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
                    name = "pad3569",
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
            name = "widgets",
            offset = 332,
            size = 12,
            what = "field"
          }, {
            address = "0x158",
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
                elementSize = 360,
                fields = { {
                    address = "0x0",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "invert",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "additive",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "alwaysActive",
                        offset = 2,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ObjectFunctionFlags",
                    name = "flags",
                    offset = 0,
                    size = 4,
                    type = "ObjectFunctionFlags",
                    what = "field"
                  }, {
                    address = "0x4",
                    is = "float",
                    name = "period",
                    offset = 4,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x8",
                    is = "int",
                    metaName = "FunctionScaleBy",
                    name = "scalePeriodBy",
                    offset = 8,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0xa",
                    is = "int",
                    metaName = "WaveFunction",
                    name = "function",
                    offset = 10,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0xc",
                    is = "int",
                    metaName = "FunctionScaleBy",
                    name = "scaleFunctionBy",
                    offset = 12,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0xe",
                    is = "int",
                    metaName = "WaveFunction",
                    name = "wobbleFunction",
                    offset = 14,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x10",
                    is = "float",
                    name = "wobblePeriod",
                    offset = 16,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x14",
                    is = "float",
                    name = "wobbleMagnitude",
                    offset = 20,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x18",
                    is = "float",
                    name = "squareWaveThreshold",
                    offset = 24,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x1c",
                    is = "int",
                    name = "stepCount",
                    offset = 28,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x1e",
                    is = "int",
                    metaName = "FunctionType",
                    name = "mapTo",
                    offset = 30,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x20",
                    is = "int",
                    name = "sawtoothCount",
                    offset = 32,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x22",
                    is = "int",
                    metaName = "FunctionScaleBy",
                    name = "add",
                    offset = 34,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x24",
                    is = "int",
                    metaName = "FunctionScaleBy",
                    name = "scaleResultBy",
                    offset = 36,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x26",
                    is = "int",
                    metaName = "FunctionBoundsMode",
                    name = "boundsMode",
                    offset = 38,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x28",
                    count = 2,
                    elementSize = 4,
                    elementType = "float",
                    is = "array",
                    name = "bounds",
                    offset = 40,
                    size = 8,
                    what = "field"
                  }, {
                    address = "0x30",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad4154",
                    offset = 48,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x34",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad4176",
                    offset = 52,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x36",
                    is = "int",
                    name = "turnOffWith",
                    offset = 54,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x38",
                    is = "float",
                    name = "scaleBy",
                    offset = 56,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x3c",
                    count = 252,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad4245",
                    offset = 60,
                    size = 252,
                    what = "field"
                  }, {
                    address = "0x138",
                    is = "float",
                    name = "inverseBounds",
                    offset = 312,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x13c",
                    is = "float",
                    name = "inverseSawtooth",
                    offset = 316,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x140",
                    is = "float",
                    name = "inverseStep",
                    offset = 320,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x144",
                    is = "float",
                    name = "inversePeriod",
                    offset = 324,
                    size = 4,
                    type = "float",
                    what = "field"
                  }, {
                    address = "0x148",
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
                    name = "usage",
                    offset = 328,
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
            name = "functions",
            offset = 344,
            size = 12,
            what = "field"
          }, {
            address = "0x164",
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
                elementSize = 44,
                fields = { {
                    address = "0x0",
                    is = "int",
                    metaName = "FunctionScaleBy",
                    name = "darkenBy",
                    offset = 0,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x2",
                    is = "int",
                    metaName = "FunctionScaleBy",
                    name = "scaleBy",
                    offset = 2,
                    size = 2,
                    type = "short",
                    what = "field"
                  }, {
                    address = "0x4",
                    fields = { {
                        address = "0x0",
                        is = "int",
                        name = "blendInHsv",
                        offset = 0,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      }, {
                        address = "0x0",
                        is = "int",
                        name = "moreColors",
                        offset = 1,
                        size = 4,
                        type = "dword",
                        unsigned = true,
                        what = "bitfield"
                      } },
                    is = "struct",
                    metaName = "ColorInterpolationFlags",
                    name = "flags",
                    offset = 4,
                    size = 4,
                    type = "ColorInterpolationFlags",
                    what = "field"
                  }, {
                    address = "0x8",
                    count = 2,
                    elementSize = 12,
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
                    is = "array",
                    name = "color",
                    offset = 8,
                    size = 24,
                    what = "field"
                  }, {
                    address = "0x20",
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
                            is = "float",
                            name = "weight",
                            offset = 0,
                            size = 4,
                            type = "float",
                            what = "field"
                          }, {
                            address = "0x4",
                            count = 2,
                            elementSize = 12,
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
                            is = "array",
                            name = "color",
                            offset = 4,
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
                    name = "permutations",
                    offset = 32,
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
            name = "changeColors",
            offset = 356,
            size = 12,
            what = "field"
          }, {
            address = "0x170",
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
            offset = 368,
            size = 12,
            what = "field"
          } },
        is = "struct",
        metaName = "Object",
        name = "base",
        offset = 0,
        size = 380,
        type = "Object",
        what = "field"
      }, {
        address = "0x17c",
        fields = { {
            address = "0x0",
            is = "int",
            name = "circularAiming",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "destroyedAfterDying",
            offset = 1,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "halfSpeedInterpolation",
            offset = 2,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "firesFromCamera",
            offset = 3,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "entranceInsideBoundingSphere",
            offset = 4,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "unused",
            offset = 5,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "causesPassengerDialogue",
            offset = 6,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "resistsPings",
            offset = 7,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "meleeAttackIsFatal",
            offset = 8,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "dontRefaceDuringPings",
            offset = 9,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "hasNoAiming",
            offset = 10,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "simpleCreature",
            offset = 11,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "impactMeleeAttachesToUnit",
            offset = 12,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "impactMeleeDiesOnShields",
            offset = 13,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "cannotOpenDoorsAutomatically",
            offset = 14,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "meleeAttackersCannotAttach",
            offset = 15,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "notInstantlyKilledByMelee",
            offset = 16,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "shieldSapping",
            offset = 17,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "runsAroundFlaming",
            offset = 18,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "inconsequential",
            offset = 19,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "specialCinematicUnit",
            offset = 20,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "ignoredByAutoaiming",
            offset = 21,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "shieldsFryInfectionForms",
            offset = 22,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "integratedLightControlsWeapon",
            offset = 23,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "integratedLightLastsForever",
            offset = 24,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "bitfield"
          } },
        is = "struct",
        metaName = "UnitFlags",
        name = "flags",
        offset = 380,
        size = 4,
        type = "UnitFlags",
        what = "field"
      }, {
        address = "0x180",
        is = "int",
        metaName = "UnitDefaultTeam",
        name = "defaultTeam",
        offset = 384,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x182",
        is = "int",
        metaName = "ObjectNoise",
        name = "constantSoundVolume",
        offset = 386,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x184",
        is = "float",
        name = "riderDamageFraction",
        offset = 388,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x188",
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
        name = "integratedLightToggle",
        offset = 392,
        size = 16,
        type = "TagReference",
        what = "field"
      }, {
        address = "0x198",
        is = "int",
        metaName = "UnitFunctionIn",
        name = "aIn",
        offset = 408,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x19a",
        is = "int",
        metaName = "UnitFunctionIn",
        name = "bIn",
        offset = 410,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x19c",
        is = "int",
        metaName = "UnitFunctionIn",
        name = "cIn",
        offset = 412,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x19e",
        is = "int",
        metaName = "UnitFunctionIn",
        name = "dIn",
        offset = 414,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x1a0",
        is = "float",
        name = "cameraFieldOfView",
        offset = 416,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x1a4",
        is = "float",
        name = "cameraStiffness",
        offset = 420,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x1a8",
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
        name = "cameraMarkerName",
        offset = 424,
        size = 32,
        type = "String32",
        what = "field"
      }, {
        address = "0x1c8",
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
        name = "cameraSubmergedMarkerName",
        offset = 456,
        size = 32,
        type = "String32",
        what = "field"
      }, {
        address = "0x1e8",
        is = "float",
        name = "pitchAutoLevel",
        offset = 488,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x1ec",
        count = 2,
        elementSize = 4,
        elementType = "float",
        is = "array",
        name = "pitchRange",
        offset = 492,
        size = 8,
        what = "field"
      }, {
        address = "0x1f4",
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
                name = "track",
                offset = 0,
                size = 16,
                type = "TagReference",
                what = "field"
              }, {
                address = "0x10",
                count = 12,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad5061",
                offset = 16,
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
        name = "cameraTracks",
        offset = 500,
        size = 12,
        what = "field"
      }, {
        address = "0x200",
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
        name = "seatAccelerationScale",
        offset = 512,
        size = 12,
        type = "VectorXYZ",
        what = "field"
      }, {
        address = "0x20c",
        count = 12,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad7301",
        offset = 524,
        size = 12,
        what = "field"
      }, {
        address = "0x218",
        is = "float",
        name = "softPingThreshold",
        offset = 536,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x21c",
        is = "float",
        name = "softPingInterruptTime",
        offset = 540,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x220",
        is = "float",
        name = "hardPingThreshold",
        offset = 544,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x224",
        is = "float",
        name = "hardPingInterruptTime",
        offset = 548,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x228",
        is = "float",
        name = "hardDeathThreshold",
        offset = 552,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x22c",
        is = "float",
        name = "feignDeathThreshold",
        offset = 556,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x230",
        is = "float",
        name = "feignDeathTime",
        offset = 560,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x234",
        is = "float",
        name = "distanceOfEvadeAnim",
        offset = 564,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x238",
        is = "float",
        name = "distanceOfDiveAnim",
        offset = 568,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x23c",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad7618",
        offset = 572,
        size = 4,
        what = "field"
      }, {
        address = "0x240",
        is = "float",
        name = "stunnedMovementThreshold",
        offset = 576,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x244",
        is = "float",
        name = "feignDeathChance",
        offset = 580,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x248",
        is = "float",
        name = "feignRepeatChance",
        offset = 584,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x24c",
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
        name = "spawnedActor",
        offset = 588,
        size = 16,
        type = "TagReference",
        what = "field"
      }, {
        address = "0x25c",
        count = 2,
        elementSize = 2,
        elementType = "short",
        is = "array",
        name = "spawnedActorCount",
        offset = 604,
        size = 4,
        what = "field"
      }, {
        address = "0x260",
        is = "float",
        name = "spawnedVelocity",
        offset = 608,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x264",
        is = "float",
        name = "aimingVelocityMaximum",
        offset = 612,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x268",
        is = "float",
        name = "aimingAccelerationMaximum",
        offset = 616,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x26c",
        is = "float",
        name = "casualAimingModifier",
        offset = 620,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x270",
        is = "float",
        name = "lookingVelocityMaximum",
        offset = 624,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x274",
        is = "float",
        name = "lookingAccelerationMaximum",
        offset = 628,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x278",
        count = 8,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad8019",
        offset = 632,
        size = 8,
        what = "field"
      }, {
        address = "0x280",
        is = "float",
        name = "aiVehicleRadius",
        offset = 640,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x284",
        is = "float",
        name = "aiDangerRadius",
        offset = 644,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x288",
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
        name = "meleeDamage",
        offset = 648,
        size = 16,
        type = "TagReference",
        what = "field"
      }, {
        address = "0x298",
        is = "int",
        metaName = "UnitMotionSensorBlipSize",
        name = "motionSensorBlipSize",
        offset = 664,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x29a",
        count = 2,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad8183",
        offset = 666,
        size = 2,
        what = "field"
      }, {
        address = "0x29c",
        fields = { {
            address = "0x0",
            is = "int",
            metaName = "MetagameType",
            name = "metagameType",
            offset = 0,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            metaName = "MetagameClass",
            name = "metagameClass",
            offset = 2,
            size = 2,
            type = "short",
            what = "field"
          } },
        is = "struct",
        metaName = "MetagameProperties",
        name = "metagameProperties",
        offset = 668,
        size = 4,
        type = "MetagameProperties",
        what = "field"
      }, {
        address = "0x2a0",
        count = 8,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad8249",
        offset = 672,
        size = 8,
        what = "field"
      }, {
        address = "0x2a8",
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
                name = "hud",
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
                name = "pad5212",
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
        name = "newHudInterfaces",
        offset = 680,
        size = 12,
        what = "field"
      }, {
        address = "0x2b4",
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
                is = "int",
                name = "variantNumber",
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
                name = "pad6504",
                offset = 2,
                size = 2,
                what = "field"
              }, {
                address = "0x4",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad6526",
                offset = 4,
                size = 4,
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
                name = "dialogue",
                offset = 8,
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
        name = "dialogueVariants",
        offset = 692,
        size = 12,
        what = "field"
      }, {
        address = "0x2c0",
        is = "float",
        name = "grenadeVelocity",
        offset = 704,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x2c4",
        is = "int",
        metaName = "GrenadeType",
        name = "grenadeType",
        offset = 708,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2c6",
        is = "int",
        name = "grenadeCount",
        offset = 710,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2c8",
        is = "int",
        name = "softPingInterruptTicks",
        offset = 712,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2ca",
        is = "int",
        name = "hardPingInterruptTicks",
        offset = 714,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2cc",
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
            elementSize = 68,
            fields = { {
                address = "0x0",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad4827",
                offset = 0,
                size = 4,
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "driverPowerupTime",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "driverPowerdownTime",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xc",
                count = 56,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad4913",
                offset = 12,
                size = 56,
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
        name = "poweredSeats",
        offset = 716,
        size = 12,
        what = "field"
      }, {
        address = "0x2d8",
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
                name = "weapon",
                offset = 0,
                size = 16,
                type = "TagReference",
                what = "field"
              }, {
                address = "0x10",
                count = 20,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad6358",
                offset = 16,
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
        name = "weapons",
        offset = 728,
        size = 12,
        what = "field"
      }, {
        address = "0x2e4",
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
            elementSize = 284,
            fields = { {
                address = "0x0",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "invisible",
                    offset = 0,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "locked",
                    offset = 1,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "driver",
                    offset = 2,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "gunner",
                    offset = 3,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "thirdPersonCamera",
                    offset = 4,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "allowsWeapons",
                    offset = 5,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "thirdPersonOnEnter",
                    offset = 6,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "firstPersonCameraSlavedToGun",
                    offset = 7,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "allowVehicleCommunicationAnimations",
                    offset = 8,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "notValidWithoutDriver",
                    offset = 9,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "allowAiNoncombatants",
                    offset = 10,
                    size = 4,
                    type = "dword",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "UnitSeatFlags",
                name = "flags",
                offset = 0,
                size = 4,
                type = "UnitSeatFlags",
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
                name = "label",
                offset = 4,
                size = 32,
                type = "String32",
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
                name = "markerName",
                offset = 36,
                size = 32,
                type = "String32",
                what = "field"
              }, {
                address = "0x44",
                count = 32,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad5585",
                offset = 68,
                size = 32,
                what = "field"
              }, {
                address = "0x64",
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
                name = "accelerationScale",
                offset = 100,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x70",
                count = 12,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad5642",
                offset = 112,
                size = 12,
                what = "field"
              }, {
                address = "0x7c",
                is = "float",
                name = "yawRate",
                offset = 124,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x80",
                is = "float",
                name = "pitchRate",
                offset = 128,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x84",
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
                name = "cameraMarkerName",
                offset = 132,
                size = 32,
                type = "String32",
                what = "field"
              }, {
                address = "0xa4",
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
                name = "cameraSubmergedMarkerName",
                offset = 164,
                size = 32,
                type = "String32",
                what = "field"
              }, {
                address = "0xc4",
                is = "float",
                name = "pitchAutoLevel",
                offset = 196,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xc8",
                count = 2,
                elementSize = 4,
                elementType = "float",
                is = "array",
                name = "pitchRange",
                offset = 200,
                size = 8,
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
                        name = "track",
                        offset = 0,
                        size = 16,
                        type = "TagReference",
                        what = "field"
                      }, {
                        address = "0x10",
                        count = 12,
                        elementSize = 1,
                        elementType = "char",
                        is = "array",
                        name = "pad5061",
                        offset = 16,
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
                name = "cameraTracks",
                offset = 208,
                size = 12,
                what = "field"
              }, {
                address = "0xdc",
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
                        name = "hud",
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
                        name = "pad5212",
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
                name = "hudInterface",
                offset = 220,
                size = 12,
                what = "field"
              }, {
                address = "0xe8",
                count = 4,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad6066",
                offset = 232,
                size = 4,
                what = "field"
              }, {
                address = "0xec",
                is = "int",
                name = "hudTextMessageIndex",
                offset = 236,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0xee",
                count = 2,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad6125",
                offset = 238,
                size = 2,
                what = "field"
              }, {
                address = "0xf0",
                is = "float",
                name = "yawMinimum",
                offset = 240,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xf4",
                is = "float",
                name = "yawMaximum",
                offset = 244,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xf8",
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
                name = "builtInGunner",
                offset = 248,
                size = 16,
                type = "TagReference",
                what = "field"
              }, {
                address = "0x108",
                count = 20,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad6227",
                offset = 264,
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
        name = "seats",
        offset = 740,
        size = 12,
        what = "field"
      } },
    is = "struct",
    metaName = "Unit",
    name = "base",
    offset = 0,
    size = 752,
    type = "Unit",
    what = "field"
  }, {
    address = "0x2f0",
    fields = { {
        address = "0x0",
        is = "int",
        name = "speedWakesPhysics",
        offset = 0,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "turnWakesPhysics",
        offset = 1,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "driverPowerWakesPhysics",
        offset = 2,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "gunnerPowerWakesPhysics",
        offset = 3,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "controlOppositeSpeedSetsBrake",
        offset = 4,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "slideWakesPhysics",
        offset = 5,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "killsRidersAtTerminalVelocity",
        offset = 6,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "causesCollisionDamage",
        offset = 7,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiWeaponCannotRotate",
        offset = 8,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiDoesNotRequireDriver",
        offset = 9,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiUnused",
        offset = 10,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiDriverEnable",
        offset = 11,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiDriverFlying",
        offset = 12,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiDriverCanSidestep",
        offset = 13,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "aiDriverHovering",
        offset = 14,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        is = "int",
        name = "vehicleSteersDirectly",
        offset = 15,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x2",
        is = "int",
        name = "unused",
        offset = 16,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x2",
        is = "int",
        name = "hasEbrake",
        offset = 17,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x2",
        is = "int",
        name = "noncombatVehicle",
        offset = 18,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x2",
        is = "int",
        name = "noFrictionWithDriver",
        offset = 19,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x2",
        is = "int",
        name = "canTriggerAutomaticOpeningDoors",
        offset = 20,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x2",
        is = "int",
        name = "autoaimWhenTeamless",
        offset = 21,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "bitfield"
      } },
    is = "struct",
    metaName = "VehicleFlags",
    name = "flags",
    offset = 752,
    size = 4,
    type = "VehicleFlags",
    what = "field"
  }, {
    address = "0x2f4",
    is = "int",
    metaName = "VehicleType",
    name = "type",
    offset = 756,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x2f6",
    count = 2,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad3367",
    offset = 758,
    size = 2,
    what = "field"
  }, {
    address = "0x2f8",
    is = "float",
    name = "maximumForwardSpeed",
    offset = 760,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x2fc",
    is = "float",
    name = "maximumReverseSpeed",
    offset = 764,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x300",
    is = "float",
    name = "speedAcceleration",
    offset = 768,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x304",
    is = "float",
    name = "speedDeceleration",
    offset = 772,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x308",
    is = "float",
    name = "maximumLeftTurn",
    offset = 776,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x30c",
    is = "float",
    name = "maximumRightTurn",
    offset = 780,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x310",
    is = "float",
    name = "wheelCircumference",
    offset = 784,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x314",
    is = "float",
    name = "turnRate",
    offset = 788,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x318",
    is = "float",
    name = "blurSpeed",
    offset = 792,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x31c",
    is = "int",
    metaName = "VehicleFunctionIn",
    name = "aIn",
    offset = 796,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x31e",
    is = "int",
    metaName = "VehicleFunctionIn",
    name = "bIn",
    offset = 798,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x320",
    is = "int",
    metaName = "VehicleFunctionIn",
    name = "cIn",
    offset = 800,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x322",
    is = "int",
    metaName = "VehicleFunctionIn",
    name = "dIn",
    offset = 802,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x324",
    count = 12,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad3760",
    offset = 804,
    size = 12,
    what = "field"
  }, {
    address = "0x330",
    is = "float",
    name = "maximumLeftSlide",
    offset = 816,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x334",
    is = "float",
    name = "maximumRightSlide",
    offset = 820,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x338",
    is = "float",
    name = "slideAcceleration",
    offset = 824,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x33c",
    is = "float",
    name = "slideDeceleration",
    offset = 828,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x340",
    is = "float",
    name = "minimumFlippingAngularVelocity",
    offset = 832,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x344",
    is = "float",
    name = "maximumFlippingAngularVelocity",
    offset = 836,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x348",
    count = 24,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad3994",
    offset = 840,
    size = 24,
    what = "field"
  }, {
    address = "0x360",
    is = "float",
    name = "fixedGunYaw",
    offset = 864,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x364",
    is = "float",
    name = "fixedGunPitch",
    offset = 868,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x368",
    count = 24,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad4069",
    offset = 872,
    size = 24,
    what = "field"
  }, {
    address = "0x380",
    is = "float",
    name = "aiSideslipDistance",
    offset = 896,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x384",
    is = "float",
    name = "aiDestinationRadius",
    offset = 900,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x388",
    is = "float",
    name = "aiAvoidanceDistance",
    offset = 904,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x38c",
    is = "float",
    name = "aiPathfindingRadius",
    offset = 908,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x390",
    is = "float",
    name = "aiChargeRepeatTimeout",
    offset = 912,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x394",
    is = "float",
    name = "aiStrafingAbortRange",
    offset = 916,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x398",
    count = 2,
    elementSize = 4,
    elementType = "float",
    is = "array",
    name = "aiOversteeringBounds",
    offset = 920,
    size = 8,
    what = "field"
  }, {
    address = "0x3a0",
    is = "float",
    name = "aiSteeringMaximum",
    offset = 928,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x3a4",
    is = "float",
    name = "aiThrottleMaximum",
    offset = 932,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x3a8",
    is = "float",
    name = "aiMovePositionTime",
    offset = 936,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x3ac",
    count = 4,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad4426",
    offset = 940,
    size = 4,
    what = "field"
  }, {
    address = "0x3b0",
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
    name = "suspensionSound",
    offset = 944,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x3c0",
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
    name = "crashSound",
    offset = 960,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x3d0",
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
    name = "materialEffects",
    offset = 976,
    size = 16,
    type = "TagReference",
    what = "field"
  }, {
    address = "0x3e0",
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
    name = "effect",
    offset = 992,
    size = 16,
    type = "TagReference",
    what = "field"
  } }
