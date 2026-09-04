return { {
    address = "0x0",
    fields = { {
        address = "0x0",
        fields = { {
            address = "0x0",
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
            offset = 0,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "networkRole",
            offset = 4,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x8",
            is = "int",
            name = "flags0",
            offset = 8,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "existenceTime",
            offset = 12,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x10",
            fields = { {
                address = "0x0",
                is = "int",
                name = "noCollision",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "onGround",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "ignoreGravity",
                offset = 2,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "inWater",
                offset = 3,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "pad1",
                offset = 4,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "stationary",
                offset = 5,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "pad2",
                offset = 6,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "noCollision2",
                offset = 7,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "pad3",
                offset = 8,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "hasSoundLoopingAttachment",
                offset = 10,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "connectedToMap",
                offset = 11,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "notPlacedAutomatically",
                offset = 12,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "isDeviceMachine",
                offset = 13,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "isElevator",
                offset = 14,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "isElevator2",
                offset = 15,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "isGarbage",
                offset = 16,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "pad4",
                offset = 17,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "noShadow",
                offset = 18,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "deleteAtDeactivation",
                offset = 19,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "doNotReactivate",
                offset = 20,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "outsideOfMap",
                offset = 21,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x2",
                is = "int",
                name = "pad5",
                offset = 22,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "collidable",
                offset = 24,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "hasCollisionModel",
                offset = 25,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "networkMessageUnknown1",
                offset = 26,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "networkMessageUnknown2",
                offset = 27,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "opensauceIsTransformingIn",
                offset = 28,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "opensauceIsTransformingOut",
                offset = 29,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x3",
                is = "int",
                name = "pad6",
                offset = 30,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "BaseDynamicObjectFlags",
            name = "flags1",
            offset = 16,
            size = 4,
            type = "BaseDynamicObjectFlags",
            what = "field"
          }, {
            address = "0x14",
            is = "int",
            name = "objectMarkerId",
            offset = 20,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x18",
            fields = { {
                address = "0x0",
                is = "int",
                name = "validPosition",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
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
                is = "int",
                name = "validForwardAndUp",
                offset = 16,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "field"
              }, {
                address = "0x14",
                count = 2,
                elementSize = 12,
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
                is = "array",
                name = "orientation",
                offset = 20,
                size = 24,
                what = "field"
              }, {
                address = "0x2c",
                is = "int",
                name = "validTransitionalVelocity",
                offset = 44,
                size = 1,
                type = "byte",
                unsigned = true,
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
                name = "transitionalVelocity",
                offset = 48,
                size = 12,
                type = "VectorXYZ",
                what = "field"
              }, {
                address = "0x3c",
                is = "int",
                name = "validTimestamp",
                offset = 60,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "field"
              }, {
                address = "0x40",
                is = "int",
                name = "timestamp",
                offset = 64,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "BaseObjectNetwork",
            name = "network",
            offset = 24,
            size = 68,
            type = "BaseObjectNetwork",
            what = "field"
          }, {
            address = "0x5c",
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
            offset = 92,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x68",
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
            name = "velocity",
            offset = 104,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0x74",
            count = 2,
            elementSize = 12,
            fields = { {
                address = "0x0",
                is = "float",
                name = "i",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "j",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "k",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "array",
            name = "rotation",
            offset = 116,
            size = 24,
            what = "field"
          }, {
            address = "0x8c",
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
            name = "rotationVelocity",
            offset = 140,
            size = 12,
            type = "VectorPYR",
            what = "field"
          }, {
            address = "0x98",
            fields = { {
                address = "0x0",
                is = "int",
                name = "leafId",
                offset = 0,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x4",
                is = "int",
                name = "clusterId",
                offset = 4,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0x6",
                count = 2,
                elementSize = 1,
                elementType = "char",
                is = "array",
                name = "pad",
                offset = 6,
                size = 2,
                what = "field"
              } },
            is = "struct",
            metaName = "ScenarioLocation",
            name = "scenarioLocation",
            offset = 152,
            size = 8,
            type = "ScenarioLocation",
            what = "field"
          }, {
            address = "0xa0",
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
            name = "center",
            offset = 160,
            size = 12,
            type = "VectorXYZ",
            what = "field"
          }, {
            address = "0xac",
            is = "float",
            name = "boundingRadius",
            offset = 172,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0xb0",
            is = "float",
            name = "scale",
            offset = 176,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0xb4",
            is = "int",
            name = "objectType",
            offset = 180,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0xb8",
            is = "int",
            name = "teamOwner",
            offset = 184,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0xba",
            is = "int",
            name = "nameListIndex",
            offset = 186,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0xbc",
            is = "int",
            name = "movingTime",
            offset = 188,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0xbe",
            is = "int",
            name = "variantIndex",
            offset = 190,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0xc0",
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
            name = "player",
            offset = 192,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0xc4",
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
            name = "ownerObject",
            offset = 196,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0xc8",
            is = "int",
            name = "pad2",
            offset = 200,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0xcc",
            fields = { {
                address = "0x0",
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
                name = "animationTagHandle",
                offset = 0,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              }, {
                address = "0x4",
                fields = { {
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
                    name = "frame",
                    offset = 2,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  } },
                is = "struct",
                metaName = "ObjectAnimationState",
                name = "animationState",
                offset = 4,
                size = 4,
                type = "ObjectAnimationState",
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "animationInterpolationFrame",
                offset = 8,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0xa",
                is = "int",
                name = "animationInterpolationFrameCount",
                offset = 10,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "ObjectAnimationData",
            name = "animationData",
            offset = 204,
            size = 12,
            type = "ObjectAnimationData",
            what = "field"
          }, {
            address = "0xd8",
            fields = { {
                address = "0x0",
                is = "float",
                name = "baseHealth",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "baseShield",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "health",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xc",
                is = "float",
                name = "shield",
                offset = 12,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x10",
                is = "float",
                name = "currentShieldDamage",
                offset = 16,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x14",
                is = "float",
                name = "currentHealthDamage",
                offset = 20,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x18",
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
                name = "entangledObjectHandle",
                offset = 24,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              }, {
                address = "0x1c",
                is = "float",
                name = "recentShieldDamage",
                offset = 28,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x20",
                is = "float",
                name = "recentHealthDamage",
                offset = 32,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x24",
                is = "int",
                name = "recentShieldDamageTime",
                offset = 36,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x28",
                is = "int",
                name = "recentHealthDamageTime",
                offset = 40,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              }, {
                address = "0x2c",
                is = "int",
                name = "shieldStunTime",
                offset = 44,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0x2e",
                fields = { {
                    address = "0x0",
                    is = "int",
                    name = "healthDamageEffectApplied",
                    offset = 0,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "shieldDamageEffectApplied",
                    offset = 1,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "healthDepleted",
                    offset = 2,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "shieldDepleted",
                    offset = 3,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "pad1",
                    offset = 4,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "killed",
                    offset = 5,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "killedSilent",
                    offset = 6,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x0",
                    is = "int",
                    name = "cannotMeleeAttack",
                    offset = 7,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "pad2",
                    offset = 8,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "invulnerable",
                    offset = 11,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "shieldRecharging",
                    offset = 12,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "killedNoStats",
                    offset = 13,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  }, {
                    address = "0x1",
                    is = "int",
                    name = "pad3",
                    offset = 14,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "bitfield"
                  } },
                is = "struct",
                metaName = "BaseObjectVitalsFlags",
                name = "flags",
                offset = 46,
                size = 2,
                type = "BaseObjectVitalsFlags",
                what = "field"
              } },
            is = "struct",
            metaName = "BaseObjectVitals",
            name = "vitals",
            offset = 216,
            size = 48,
            type = "BaseObjectVitals",
            what = "field"
          }, {
            address = "0x108",
            is = "int",
            name = "pad3",
            offset = 264,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x10c",
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
            name = "clusterPartition",
            offset = 268,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x110",
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
            name = "unknownObject",
            offset = 272,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x114",
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
            name = "nextObject",
            offset = 276,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x118",
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
            name = "firstObject",
            offset = 280,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x11c",
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
            name = "parentObject",
            offset = 284,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x120",
            is = "int",
            name = "parentAttachmentNode",
            offset = 288,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x121",
            is = "int",
            name = "pad4",
            offset = 289,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x122",
            is = "int",
            name = "forceShieldUpdate",
            offset = 290,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x123",
            fields = { {
                address = "0x0",
                is = "int",
                name = "a",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "b",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "c",
                offset = 2,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "d",
                offset = 3,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "pad1",
                offset = 4,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "ObjectValidOutGoingFunctions",
            name = "validOutgoingFunctions",
            offset = 291,
            size = 1,
            type = "ObjectValidOutGoingFunctions",
            what = "field"
          }, {
            address = "0x124",
            count = 4,
            elementSize = 4,
            elementType = "float",
            is = "array",
            name = "incomingFunctionValues",
            offset = 292,
            size = 16,
            what = "field"
          }, {
            address = "0x134",
            count = 4,
            elementSize = 4,
            elementType = "float",
            is = "array",
            name = "outgoingFunctionValues",
            offset = 308,
            size = 16,
            what = "field"
          }, {
            address = "0x144",
            fields = { {
                address = "0x0",
                count = 8,
                elementSize = 1,
                elementType = "byte",
                is = "array",
                name = "types",
                offset = 0,
                size = 8,
                what = "field"
              }, {
                address = "0x8",
                count = 8,
                elementSize = 4,
                elementType = "dword",
                is = "array",
                name = "attachments",
                offset = 8,
                size = 32,
                what = "field"
              }, {
                address = "0x28",
                is = "int",
                name = "firstWidget",
                offset = 40,
                size = 4,
                type = "dword",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "BaseObjectAttachmentsData",
            name = "attachmentData",
            offset = 324,
            size = 44,
            type = "BaseObjectAttachmentsData",
            what = "field"
          }, {
            address = "0x170",
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
            name = "cachedRenderState",
            offset = 368,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          }, {
            address = "0x174",
            fields = { {
                address = "0x0",
                is = "int",
                name = "region0",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region1",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region2",
                offset = 2,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region3",
                offset = 3,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region4",
                offset = 4,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region5",
                offset = 5,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region6",
                offset = 6,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "region7",
                offset = 7,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "pad1",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "BaseObjectRegionDestroyeds",
            name = "regionDestroyeds",
            offset = 372,
            size = 2,
            type = "BaseObjectRegionDestroyeds",
            what = "field"
          }, {
            address = "0x176",
            is = "int",
            name = "shaderPermutation",
            offset = 374,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x178",
            count = 8,
            elementSize = 1,
            elementType = "byte",
            is = "array",
            name = "regionHealths",
            offset = 376,
            size = 8,
            what = "field"
          }, {
            address = "0x180",
            count = 8,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "regionPermutationIds",
            offset = 384,
            size = 8,
            what = "field"
          }, {
            address = "0x188",
            count = 4,
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
            name = "colorChange",
            offset = 392,
            size = 48,
            what = "field"
          }, {
            address = "0x1b8",
            count = 4,
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
            name = "colorChange2",
            offset = 440,
            size = 48,
            what = "field"
          }, {
            address = "0x1e8",
            count = 2,
            elementSize = 4,
            fields = { {
                address = "0x0",
                is = "int",
                name = "size",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "offset",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "array",
            name = "nodeOrientations",
            offset = 488,
            size = 8,
            what = "field"
          }, {
            address = "0x1f0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "size",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "offset",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "BaseObjectBlockReference",
            name = "nodeMatricesBlock",
            offset = 496,
            size = 4,
            type = "BaseObjectBlockReference",
            what = "field"
          } },
        is = "struct",
        metaName = "DynamicObjectBase",
        name = "base",
        offset = 0,
        size = 500,
        type = "DynamicObjectBase",
        what = "field"
      }, {
        address = "0x1f4",
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
        name = "actorTag",
        offset = 500,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x1f8",
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
        name = "swarmActorTag",
        offset = 504,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x1fc",
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
        name = "swarmNextUnit",
        offset = 508,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x200",
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
        name = "swarmPreviousUnit",
        offset = 512,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x204",
        fields = { {
            address = "0x0",
            is = "int",
            name = "unknownBipedSpeechRelated",
            offset = 0,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "pad1",
            offset = 1,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "powerUp",
            offset = 4,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "powerUpAddition",
            offset = 5,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "controllable",
            offset = 6,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "berserking",
            offset = 7,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "pad2",
            offset = 1,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "pad3",
            offset = 16,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "unknownIntegratedLightRelated",
            offset = 19,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "willNotDropItems",
            offset = 20,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "unknown",
            offset = 21,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "canBlink",
            offset = 22,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x2",
            is = "int",
            name = "impervious",
            offset = 23,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "suspended",
            offset = 24,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "blind",
            offset = 25,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "unknownNvRelated",
            offset = 26,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "possessed",
            offset = 27,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "desiresFlashlightOn",
            offset = 28,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "desiresFlashlightOff",
            offset = 29,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x3",
            is = "int",
            name = "pad4",
            offset = 30,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          } },
        is = "struct",
        metaName = "UnitFlags",
        name = "unitFlags",
        offset = 516,
        size = 4,
        type = "UnitFlags",
        what = "field"
      }, {
        address = "0x208",
        fields = { {
            address = "0x0",
            is = "int",
            name = "crouch",
            offset = 0,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "jump",
            offset = 1,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "user1",
            offset = 2,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "user2",
            offset = 3,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "light",
            offset = 4,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "exactFacing",
            offset = 5,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "action",
            offset = 6,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x0",
            is = "int",
            name = "melee",
            offset = 7,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "lookDontTurn",
            offset = 8,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "forceAlert",
            offset = 9,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "reload",
            offset = 10,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "primaryTrigger",
            offset = 11,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "secondaryTrigger",
            offset = 12,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "grenade",
            offset = 13,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "exchangeWeapon",
            offset = 14,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          }, {
            address = "0x1",
            is = "int",
            name = "pad1",
            offset = 15,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "bitfield"
          } },
        is = "struct",
        metaName = "UnitControlFlags",
        name = "unitControlFlags",
        offset = 520,
        size = 2,
        type = "UnitControlFlags",
        what = "field"
      }, {
        address = "0x20a",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad1",
        offset = 522,
        size = 4,
        what = "field"
      }, {
        address = "0x20e",
        is = "int",
        name = "shieldSnapping",
        offset = 526,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x20f",
        is = "int",
        name = "baseSeatIndex",
        offset = 527,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x210",
        fields = { {
            address = "0x0",
            is = "int",
            name = "ticksRemaining",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            fields = { {
                address = "0x0",
                is = "int",
                name = "crouch",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "jump",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "user1",
                offset = 2,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "user2",
                offset = 3,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "light",
                offset = 4,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "exactFacing",
                offset = 5,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "action",
                offset = 6,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "melee",
                offset = 7,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "lookDontTurn",
                offset = 8,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "forceAlert",
                offset = 9,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "reload",
                offset = 10,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "primaryTrigger",
                offset = 11,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "secondaryTrigger",
                offset = 12,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "grenade",
                offset = 13,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "exchangeWeapon",
                offset = 14,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "pad1",
                offset = 15,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "UnitControlFlags",
            name = "controlFlags",
            offset = 4,
            size = 2,
            type = "UnitControlFlags",
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            name = "pad1",
            offset = 6,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          } },
        is = "struct",
        name = "persistentControl",
        offset = 528,
        size = 8,
        what = "field"
      }, {
        address = "0x218",
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
        name = "controllingPlayer",
        offset = 536,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x21c",
        is = "int",
        name = "aiEffectType",
        offset = 540,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x21e",
        is = "int",
        name = "emotionAnimationIndex",
        offset = 542,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x220",
        is = "int",
        name = "nextAiEffectTick",
        offset = 544,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x224",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "desiredFacingVector",
        offset = 548,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x230",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "desiredAimingVector",
        offset = 560,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x23c",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "aimingVector",
        offset = 572,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x248",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "aimingVelocity",
        offset = 584,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x254",
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
        name = "lookingAngles",
        offset = 596,
        size = 12,
        type = "VectorPYR",
        what = "field"
      }, {
        address = "0x260",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "lookingVector",
        offset = 608,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x26c",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "lookingVelocity",
        offset = 620,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x278",
        fields = { {
            address = "0x0",
            is = "float",
            name = "i",
            offset = 0,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "j",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "k",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          } },
        is = "struct",
        metaName = "VectorIJK",
        name = "throttle",
        offset = 632,
        size = 12,
        type = "VectorIJK",
        what = "field"
      }, {
        address = "0x284",
        is = "float",
        name = "primaryTrigger",
        offset = 644,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x288",
        is = "int",
        name = "aimingSpeed",
        offset = 648,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x289",
        is = "int",
        name = "meleeState",
        offset = 649,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x28a",
        is = "int",
        name = "meleeTimer",
        offset = 650,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x28b",
        is = "int",
        name = "ticksUntilFlameToDeath",
        offset = 651,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x28c",
        is = "int",
        name = "pingAnimationTicksLeft",
        offset = 652,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x28d",
        is = "int",
        name = "grenadeState",
        offset = 653,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x28e",
        is = "int",
        name = "unknown725",
        offset = 654,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x290",
        is = "int",
        name = "unknown726",
        offset = 656,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x292",
        is = "int",
        name = "pad2",
        offset = 658,
        size = 2,
        type = "word",
        unsigned = true,
        what = "field"
      }, {
        address = "0x294",
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
        name = "grenadeProjectile",
        offset = 660,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x298",
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "animationBit0Unknown",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "animationBit1Unknown",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "animationBit2Unknown",
                offset = 2,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "animationBit3Unknown",
                offset = 3,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "pad1",
                offset = 4,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "pad2",
                offset = 8,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "UnitAnimationFlags",
            name = "flags",
            offset = 0,
            size = 2,
            type = "UnitAnimationFlags",
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "unknownSomeAnimationIndexMaybe",
            offset = 2,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "unknownSomeAnimationIndex",
            offset = 4,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            name = "pad1",
            offset = 6,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x8",
            is = "int",
            name = "seatIndex",
            offset = 8,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x9",
            is = "int",
            name = "seatWeaponIndex",
            offset = 9,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0xa",
            is = "int",
            name = "weaponTypeIndex",
            offset = 10,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0xb",
            is = "int",
            name = "state",
            offset = 11,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "replacementState",
            offset = 12,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0xd",
            is = "int",
            name = "overlayState",
            offset = 13,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0xe",
            is = "int",
            name = "desiredState",
            offset = 14,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0xf",
            is = "int",
            name = "baseSeat",
            offset = 15,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x10",
            is = "int",
            name = "emotion",
            offset = 16,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x11",
            is = "int",
            name = "pad2",
            offset = 17,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x12",
            fields = { {
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
                name = "frame",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "ObjectAnimationState",
            name = "replacementAnimation",
            offset = 18,
            size = 4,
            type = "ObjectAnimationState",
            what = "field"
          }, {
            address = "0x16",
            fields = { {
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
                name = "frame",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "ObjectAnimationState",
            name = "overlayStateAnimation",
            offset = 22,
            size = 4,
            type = "ObjectAnimationState",
            what = "field"
          }, {
            address = "0x1a",
            fields = { {
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
                name = "frame",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "ObjectAnimationState",
            name = "weaponIk",
            offset = 26,
            size = 4,
            type = "ObjectAnimationState",
            what = "field"
          }, {
            address = "0x1e",
            is = "int",
            name = "updateLook",
            offset = 30,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x1f",
            is = "int",
            name = "updateAim",
            offset = 31,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x20",
            fields = { {
                address = "0x0",
                is = "float",
                name = "left",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "right",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "top",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xc",
                is = "float",
                name = "bottom",
                offset = 12,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "Bounds2D",
            name = "lookingBounds",
            offset = 32,
            size = 16,
            type = "Bounds2D",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "float",
                name = "left",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "right",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "top",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0xc",
                is = "float",
                name = "bottom",
                offset = 12,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "Bounds2D",
            name = "aimingBounds",
            offset = 48,
            size = 16,
            type = "Bounds2D",
            what = "field"
          }, {
            address = "0x40",
            count = 0,
            elementSize = "none",
            elementType = "void",
            is = "ptr",
            name = "externalAnimationGraph",
            offset = 64,
            size = 4,
            what = "field"
          }, {
            address = "0x44",
            fields = { {
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
                name = "frame",
                offset = 2,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              } },
            is = "struct",
            metaName = "ObjectAnimationState",
            name = "externalAnimation",
            offset = 68,
            size = 4,
            type = "ObjectAnimationState",
            what = "field"
          } },
        is = "struct",
        metaName = "UnitAnimationData",
        name = "animation",
        offset = 664,
        size = 72,
        type = "UnitAnimationData",
        what = "field"
      }, {
        address = "0x2e0",
        is = "float",
        name = "ambient",
        offset = 736,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x2e4",
        is = "float",
        name = "illumination",
        offset = 740,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x2e8",
        is = "float",
        name = "mouthFactor",
        offset = 744,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x2ec",
        is = "int",
        name = "pad3",
        offset = 748,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x2f0",
        is = "int",
        name = "vehicleSeatId",
        offset = 752,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2f2",
        is = "int",
        name = "currentWeaponId",
        offset = 754,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2f4",
        is = "int",
        name = "nextWeaponId",
        offset = 756,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x2f6",
        is = "int",
        name = "pad4",
        offset = 758,
        size = 2,
        type = "word",
        unsigned = true,
        what = "field"
      }, {
        address = "0x2f8",
        count = 4,
        elementSize = 4,
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
        is = "array",
        name = "weapons",
        offset = 760,
        size = 16,
        what = "field"
      }, {
        address = "0x308",
        count = 4,
        elementSize = 4,
        elementType = "dword",
        is = "array",
        name = "weaponReadyTicks",
        offset = 776,
        size = 16,
        what = "field"
      }, {
        address = "0x318",
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
        name = "equipmentHandle",
        offset = 792,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x31c",
        is = "int",
        name = "currentGrenadeIndex",
        offset = 796,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x31d",
        is = "int",
        name = "nextGrenadeIndex",
        offset = 797,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x31e",
        count = 2,
        elementSize = 1,
        elementType = "byte",
        is = "array",
        name = "grenadeCounts",
        offset = 798,
        size = 2,
        what = "field"
      }, {
        address = "0x320",
        is = "int",
        name = "zoomLevel",
        offset = 800,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x321",
        is = "int",
        name = "desiredZoomLevel",
        offset = 801,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x322",
        is = "int",
        name = "ticksSinceLastVehicleSpeech",
        offset = 802,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x323",
        is = "int",
        name = "aimingChange",
        offset = 803,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x324",
        count = 2,
        elementSize = 4,
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
        is = "array",
        name = "poweredSeatsRiders",
        offset = 804,
        size = 8,
        what = "field"
      }, {
        address = "0x32c",
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
        name = "unknown22",
        offset = 812,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x330",
        is = "int",
        name = "someTickTime",
        offset = 816,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x334",
        is = "int",
        name = "encounterId",
        offset = 820,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x336",
        is = "int",
        name = "squadId",
        offset = 822,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x338",
        count = 2,
        elementSize = 4,
        elementType = "float",
        is = "array",
        name = "poweredSeatsPower",
        offset = 824,
        size = 8,
        what = "field"
      }, {
        address = "0x340",
        is = "float",
        name = "integratedLightPower",
        offset = 832,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x344",
        is = "float",
        name = "integratedLightTogglePower",
        offset = 836,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x348",
        is = "float",
        name = "integratedNightVisionTogglePower",
        offset = 840,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x34c",
        count = 4,
        elementSize = 12,
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
        is = "array",
        name = "seatRelated",
        offset = 844,
        size = 48,
        what = "field"
      }, {
        address = "0x37c",
        is = "float",
        name = "camoPower",
        offset = 892,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x380",
        is = "float",
        name = "fullSpectrumVisionPower",
        offset = 896,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x384",
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
        name = "dialogueDefinition",
        offset = 900,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x388",
        fields = { {
            address = "0x0",
            fields = { {
                address = "0x0",
                is = "int",
                name = "priority",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "screamType",
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
                name = "soundTag",
                offset = 4,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "ticks",
                offset = 8,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0xa",
                is = "int",
                name = "unknown2",
                offset = 10,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0xc",
                is = "int",
                name = "unknown",
                offset = 12,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    count = 6,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad1",
                    offset = 0,
                    size = 6,
                    what = "field"
                  }, {
                    address = "0x6",
                    is = "int",
                    name = "type",
                    offset = 6,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x8",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad2",
                    offset = 8,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0xa",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad3",
                    offset = 10,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0xc",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad4",
                    offset = 12,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0xe",
                    count = 6,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad5",
                    offset = 14,
                    size = 6,
                    what = "field"
                  }, {
                    address = "0x14",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad6",
                    offset = 20,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x16",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad7",
                    offset = 22,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x18",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad8",
                    offset = 24,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x1c",
                    is = "int",
                    name = "broken",
                    offset = 28,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x1d",
                    count = 3,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad9",
                    offset = 29,
                    size = 3,
                    what = "field"
                  } },
                is = "struct",
                metaName = "AiCommunicationPacket",
                name = "aiCommunicationInfo",
                offset = 16,
                size = 32,
                type = "AiCommunicationPacket",
                what = "field"
              } },
            is = "struct",
            metaName = "UnitSpeech",
            name = "current",
            offset = 0,
            size = 48,
            type = "UnitSpeech",
            what = "field"
          }, {
            address = "0x30",
            fields = { {
                address = "0x0",
                is = "int",
                name = "priority",
                offset = 0,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0x2",
                is = "int",
                name = "screamType",
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
                name = "soundTag",
                offset = 4,
                size = 4,
                type = "TableResourceHandle",
                what = "field"
              }, {
                address = "0x8",
                is = "int",
                name = "ticks",
                offset = 8,
                size = 2,
                type = "word",
                unsigned = true,
                what = "field"
              }, {
                address = "0xa",
                is = "int",
                name = "unknown2",
                offset = 10,
                size = 2,
                type = "short",
                what = "field"
              }, {
                address = "0xc",
                is = "int",
                name = "unknown",
                offset = 12,
                size = 4,
                type = "int",
                what = "field"
              }, {
                address = "0x10",
                fields = { {
                    address = "0x0",
                    count = 6,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad1",
                    offset = 0,
                    size = 6,
                    what = "field"
                  }, {
                    address = "0x6",
                    is = "int",
                    name = "type",
                    offset = 6,
                    size = 2,
                    type = "word",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x8",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad2",
                    offset = 8,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0xa",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad3",
                    offset = 10,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0xc",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad4",
                    offset = 12,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0xe",
                    count = 6,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad5",
                    offset = 14,
                    size = 6,
                    what = "field"
                  }, {
                    address = "0x14",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad6",
                    offset = 20,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x16",
                    count = 2,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad7",
                    offset = 22,
                    size = 2,
                    what = "field"
                  }, {
                    address = "0x18",
                    count = 4,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad8",
                    offset = 24,
                    size = 4,
                    what = "field"
                  }, {
                    address = "0x1c",
                    is = "int",
                    name = "broken",
                    offset = 28,
                    size = 1,
                    type = "byte",
                    unsigned = true,
                    what = "field"
                  }, {
                    address = "0x1d",
                    count = 3,
                    elementSize = 1,
                    elementType = "char",
                    is = "array",
                    name = "pad9",
                    offset = 29,
                    size = 3,
                    what = "field"
                  } },
                is = "struct",
                metaName = "AiCommunicationPacket",
                name = "aiCommunicationInfo",
                offset = 16,
                size = 32,
                type = "AiCommunicationPacket",
                what = "field"
              } },
            is = "struct",
            metaName = "UnitSpeech",
            name = "next",
            offset = 48,
            size = 48,
            type = "UnitSpeech",
            what = "field"
          }, {
            address = "0x60",
            is = "int",
            name = "unknown0",
            offset = 96,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x62",
            is = "int",
            name = "unknown1",
            offset = 98,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x64",
            is = "int",
            name = "unknown2",
            offset = 100,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x66",
            is = "int",
            name = "unknown3",
            offset = 102,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x68",
            is = "int",
            name = "unknown4",
            offset = 104,
            size = 4,
            type = "int",
            what = "field"
          }, {
            address = "0x6c",
            is = "int",
            name = "unknown6",
            offset = 108,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x6d",
            is = "int",
            name = "unknown7",
            offset = 109,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x6e",
            is = "int",
            name = "unknown8",
            offset = 110,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x6f",
            is = "int",
            name = "pad1",
            offset = 111,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0x70",
            is = "int",
            name = "unknown9",
            offset = 112,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x72",
            is = "int",
            name = "unknown10",
            offset = 114,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x74",
            is = "int",
            name = "unknown11",
            offset = 116,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x76",
            is = "int",
            name = "unknown12",
            offset = 118,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x78",
            is = "int",
            name = "unknown13",
            offset = 120,
            size = 4,
            type = "int",
            what = "field"
          } },
        is = "struct",
        metaName = "UnitSpeechData",
        name = "speech",
        offset = 904,
        size = 124,
        type = "UnitSpeechData",
        what = "field"
      }, {
        address = "0x404",
        fields = { {
            address = "0x0",
            is = "int",
            name = "category",
            offset = 0,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x2",
            is = "int",
            name = "aiTicksUntilHandle",
            offset = 2,
            size = 2,
            type = "word",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "amount",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
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
            name = "responsibleUnit",
            offset = 8,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          } },
        is = "struct",
        name = "damageResult",
        offset = 1028,
        size = 12,
        what = "field"
      }, {
        address = "0x410",
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
        name = "objectFlameCauser",
        offset = 1040,
        size = 4,
        type = "TableResourceHandle",
        what = "field"
      }, {
        address = "0x414",
        is = "float",
        name = "unknown23",
        offset = 1044,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x418",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad5",
        offset = 1048,
        size = 4,
        what = "field"
      }, {
        address = "0x41c",
        is = "int",
        name = "diedAtTick",
        offset = 1052,
        size = 4,
        type = "dword",
        unsigned = true,
        what = "field"
      }, {
        address = "0x420",
        is = "int",
        name = "feignDeathTimer",
        offset = 1056,
        size = 2,
        type = "word",
        unsigned = true,
        what = "field"
      }, {
        address = "0x422",
        is = "int",
        name = "camoRegrowth",
        offset = 1058,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x423",
        is = "int",
        name = "pad6",
        offset = 1059,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x424",
        is = "float",
        name = "stun",
        offset = 1060,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x428",
        is = "int",
        name = "stunTicks",
        offset = 1064,
        size = 2,
        type = "word",
        unsigned = true,
        what = "field"
      }, {
        address = "0x42a",
        is = "int",
        name = "spreeCount",
        offset = 1066,
        size = 2,
        type = "short",
        what = "field"
      }, {
        address = "0x42c",
        is = "int",
        name = "spreeStartingTime",
        offset = 1068,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x430",
        count = 4,
        elementSize = 16,
        fields = { {
            address = "0x0",
            is = "int",
            name = "lastDamageTime",
            offset = 0,
            size = 4,
            type = "dword",
            unsigned = true,
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "totalDamage",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
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
            name = "object",
            offset = 8,
            size = 4,
            type = "TableResourceHandle",
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
            name = "player",
            offset = 12,
            size = 4,
            type = "TableResourceHandle",
            what = "field"
          } },
        is = "array",
        name = "recentDamage",
        offset = 1072,
        size = 64,
        what = "field"
      }, {
        address = "0x470",
        count = 4,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad7",
        offset = 1136,
        size = 4,
        what = "field"
      }, {
        address = "0x474",
        count = 2,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad8",
        offset = 1140,
        size = 2,
        what = "field"
      }, {
        address = "0x476",
        is = "int",
        name = "opensauceZoomLevel",
        offset = 1142,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x477",
        is = "int",
        name = "opensauceDesiredZoomLevel",
        offset = 1143,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x478",
        fields = { {
            address = "0x0",
            is = "int",
            name = "animationState",
            offset = 0,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x1",
            is = "int",
            name = "aimingSpeed",
            offset = 1,
            size = 1,
            type = "char",
            what = "field"
          }, {
            address = "0x2",
            fields = { {
                address = "0x0",
                is = "int",
                name = "crouch",
                offset = 0,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "jump",
                offset = 1,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "user1",
                offset = 2,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "user2",
                offset = 3,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "light",
                offset = 4,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "exactFacing",
                offset = 5,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "action",
                offset = 6,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x0",
                is = "int",
                name = "melee",
                offset = 7,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "lookDontTurn",
                offset = 8,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "forceAlert",
                offset = 9,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "reload",
                offset = 10,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "primaryTrigger",
                offset = 11,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "secondaryTrigger",
                offset = 12,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "grenade",
                offset = 13,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "exchangeWeapon",
                offset = 14,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              }, {
                address = "0x1",
                is = "int",
                name = "pad1",
                offset = 15,
                size = 1,
                type = "byte",
                unsigned = true,
                what = "bitfield"
              } },
            is = "struct",
            metaName = "UnitControlFlags",
            name = "controlFlags",
            offset = 2,
            size = 2,
            type = "UnitControlFlags",
            what = "field"
          }, {
            address = "0x4",
            is = "int",
            name = "weaponIndex",
            offset = 4,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x6",
            is = "int",
            name = "grenadeIndex",
            offset = 6,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0x8",
            is = "int",
            name = "zoomIndex",
            offset = 8,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0xa",
            is = "int",
            name = "pad1",
            offset = 10,
            size = 2,
            type = "short",
            what = "field"
          }, {
            address = "0xc",
            fields = { {
                address = "0x0",
                is = "float",
                name = "i",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "j",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "k",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorIJK",
            name = "throttle",
            offset = 12,
            size = 12,
            type = "VectorIJK",
            what = "field"
          }, {
            address = "0x18",
            is = "float",
            name = "primaryTrigger",
            offset = 24,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x1c",
            fields = { {
                address = "0x0",
                is = "float",
                name = "i",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "j",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "k",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorIJK",
            name = "facingVector",
            offset = 28,
            size = 12,
            type = "VectorIJK",
            what = "field"
          }, {
            address = "0x28",
            fields = { {
                address = "0x0",
                is = "float",
                name = "i",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "j",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "k",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorIJK",
            name = "aimingVector",
            offset = 40,
            size = 12,
            type = "VectorIJK",
            what = "field"
          }, {
            address = "0x34",
            fields = { {
                address = "0x0",
                is = "float",
                name = "i",
                offset = 0,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x4",
                is = "float",
                name = "j",
                offset = 4,
                size = 4,
                type = "float",
                what = "field"
              }, {
                address = "0x8",
                is = "float",
                name = "k",
                offset = 8,
                size = 4,
                type = "float",
                what = "field"
              } },
            is = "struct",
            metaName = "VectorIJK",
            name = "lookingVector",
            offset = 52,
            size = 12,
            type = "VectorIJK",
            what = "field"
          } },
        is = "struct",
        metaName = "UnitControlData",
        name = "controlData",
        offset = 1144,
        size = 64,
        type = "UnitControlData",
        what = "field"
      }, {
        address = "0x4b8",
        is = "int",
        name = "lastCompletedClientUpdateValid",
        offset = 1208,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x4b9",
        count = 3,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad9",
        offset = 1209,
        size = 3,
        what = "field"
      }, {
        address = "0x4bc",
        is = "int",
        name = "lastCompletedClientUpdateId",
        offset = 1212,
        size = 4,
        type = "int",
        what = "field"
      }, {
        address = "0x4c0",
        count = 12,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad10",
        offset = 1216,
        size = 12,
        what = "field"
      } },
    is = "struct",
    metaName = "UnitObject",
    name = "base",
    offset = 0,
    size = 1228,
    type = "UnitObject",
    what = "field"
  }, {
    address = "0x4cc",
    fields = { {
        address = "0x0",
        is = "int",
        name = "airborne",
        offset = 0,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "slipping",
        offset = 1,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "absoluteMovement",
        offset = 2,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "noCollision",
        offset = 3,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "passesThroughOtherBipeds",
        offset = 4,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "limping2",
        offset = 5,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x0",
        is = "int",
        name = "pad1",
        offset = 6,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "bitfield"
      }, {
        address = "0x1",
        count = 3,
        elementSize = 1,
        elementType = "byte",
        is = "array",
        name = "pad2",
        offset = 1,
        size = 3,
        what = "field"
      } },
    is = "struct",
    metaName = "BipedFlags",
    name = "bipedFlags",
    offset = 1228,
    size = 4,
    type = "BipedFlags",
    what = "field"
  }, {
    address = "0x4d0",
    is = "int",
    name = "landingTimer",
    offset = 1232,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x4d1",
    is = "int",
    name = "landingForce",
    offset = 1233,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x4d2",
    is = "int",
    name = "movementState",
    offset = 1234,
    size = 1,
    type = "byte",
    unsigned = true,
    what = "field"
  }, {
    address = "0x4d3",
    is = "int",
    name = "pad1",
    offset = 1235,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x4d4",
    is = "int",
    name = "bipedUnknown3",
    offset = 1236,
    size = 4,
    type = "int",
    what = "field"
  }, {
    address = "0x4d8",
    is = "int",
    name = "actionFlags",
    offset = 1240,
    size = 4,
    type = "dword",
    unsigned = true,
    what = "field"
  }, {
    address = "0x4dc",
    is = "int",
    name = "bipedUnknown4",
    offset = 1244,
    size = 4,
    type = "int",
    what = "field"
  }, {
    address = "0x4e0",
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
    name = "bipedPosition",
    offset = 1248,
    size = 12,
    type = "VectorXYZ",
    what = "field"
  }, {
    address = "0x4ec",
    is = "int",
    name = "walkingCounter",
    offset = 1260,
    size = 4,
    type = "int",
    what = "field"
  }, {
    address = "0x4f0",
    count = 12,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad2",
    offset = 1264,
    size = 12,
    what = "field"
  }, {
    address = "0x4fc",
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
    name = "bumpObject",
    offset = 1276,
    size = 4,
    type = "TableResourceHandle",
    what = "field"
  }, {
    address = "0x500",
    is = "int",
    name = "ticksSinceLastBump",
    offset = 1280,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x501",
    is = "int",
    name = "airborneTicks",
    offset = 1281,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x502",
    is = "int",
    name = "slippingTicks",
    offset = 1282,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x503",
    is = "int",
    name = "digitalThrottle",
    offset = 1283,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x504",
    is = "int",
    name = "jumpTicks",
    offset = 1284,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x505",
    is = "int",
    name = "meleeTicks",
    offset = 1285,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x506",
    is = "int",
    name = "meleeInflictTicks",
    offset = 1286,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x507",
    is = "int",
    name = "pad3",
    offset = 1287,
    size = 1,
    type = "char",
    what = "field"
  }, {
    address = "0x508",
    is = "int",
    name = "unknownBiped2",
    offset = 1288,
    size = 2,
    type = "short",
    what = "field"
  }, {
    address = "0x50a",
    count = 2,
    elementSize = 1,
    elementType = "char",
    is = "array",
    name = "pad4",
    offset = 1290,
    size = 2,
    what = "field"
  }, {
    address = "0x50c",
    is = "float",
    name = "crouchScale",
    offset = 1292,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x510",
    is = "float",
    name = "unknownBiped1",
    offset = 1296,
    size = 4,
    type = "float",
    what = "field"
  }, {
    address = "0x514",
    fields = { {
        address = "0x0",
        is = "float",
        name = "i",
        offset = 0,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x4",
        is = "float",
        name = "j",
        offset = 4,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0x8",
        is = "float",
        name = "k",
        offset = 8,
        size = 4,
        type = "float",
        what = "field"
      }, {
        address = "0xc",
        is = "float",
        name = "w",
        offset = 12,
        size = 4,
        type = "float",
        what = "field"
      } },
    is = "struct",
    metaName = "Plane3D",
    name = "unknownBipedPhysicsRelated",
    offset = 1300,
    size = 16,
    type = "Plane3D",
    what = "field"
  }, {
    address = "0x524",
    fields = { {
        address = "0x0",
        count = 2,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad1",
        offset = 0,
        size = 2,
        what = "field"
      }, {
        address = "0x2",
        is = "int",
        name = "baselineValid",
        offset = 2,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x3",
        is = "int",
        name = "baselineId",
        offset = 3,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x4",
        is = "int",
        name = "messageId",
        offset = 4,
        size = 1,
        type = "char",
        what = "field"
      }, {
        address = "0x5",
        count = 3,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad2",
        offset = 5,
        size = 3,
        what = "field"
      }, {
        address = "0x8",
        fields = { {
            address = "0x0",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "grenadeCounts",
            offset = 0,
            size = 2,
            what = "field"
          }, {
            address = "0x2",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad1",
            offset = 2,
            size = 2,
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "bodyVitality",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "shieldVitality",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "shieldStunTicksGreaterThanZero",
            offset = 12,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0xd",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad2",
            offset = 13,
            size = 3,
            what = "field"
          } },
        is = "struct",
        metaName = "BipedNetworkDelta",
        name = "updateBaseline",
        offset = 8,
        size = 16,
        type = "BipedNetworkDelta",
        what = "field"
      }, {
        address = "0x18",
        is = "int",
        name = "deltaValid",
        offset = 24,
        size = 1,
        type = "byte",
        unsigned = true,
        what = "field"
      }, {
        address = "0x19",
        count = 3,
        elementSize = 1,
        elementType = "char",
        is = "array",
        name = "pad3",
        offset = 25,
        size = 3,
        what = "field"
      }, {
        address = "0x1c",
        fields = { {
            address = "0x0",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "grenadeCounts",
            offset = 0,
            size = 2,
            what = "field"
          }, {
            address = "0x2",
            count = 2,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad1",
            offset = 2,
            size = 2,
            what = "field"
          }, {
            address = "0x4",
            is = "float",
            name = "bodyVitality",
            offset = 4,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0x8",
            is = "float",
            name = "shieldVitality",
            offset = 8,
            size = 4,
            type = "float",
            what = "field"
          }, {
            address = "0xc",
            is = "int",
            name = "shieldStunTicksGreaterThanZero",
            offset = 12,
            size = 1,
            type = "byte",
            unsigned = true,
            what = "field"
          }, {
            address = "0xd",
            count = 3,
            elementSize = 1,
            elementType = "char",
            is = "array",
            name = "pad2",
            offset = 13,
            size = 3,
            what = "field"
          } },
        is = "struct",
        metaName = "BipedNetworkDelta",
        name = "updateDelta",
        offset = 28,
        size = 16,
        type = "BipedNetworkDelta",
        what = "field"
      } },
    is = "struct",
    metaName = "BipedNetwork",
    name = "network",
    offset = 1316,
    size = 44,
    type = "BipedNetwork",
    what = "field"
  } }
