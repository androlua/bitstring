require "os"
require "test_helpers"
require "bitstring"

local test1 = function()
    local expected = 
[[00000000: 00000000 00000001 00000010 00000011     ....
00000004: 00000100 00000101 00000110 00000111     ....
00000008: 00001000 00001001 00001010 00001011     ....
0000000c: 00001100 00001101 00001110 00001111     ....
00000010: 00010000 00010001 00010010 00010011     ....
00000014: 00010100 00010101 00010110 00010111     ....
00000018: 00011000 00011001 00011010 00011011     ....
0000001c: 00011100 00011101 00011110 00011111     ....
00000020: 00100000 00100001 00100010 00100011      !"#
00000024: 00100100 00100101 00100110 00100111     $%&'
00000028: 00101000 00101001 00101010 00101011     ()*+
0000002c: 00101100 00101101 00101110 00101111     ,-./
00000030: 00110000 00110001 00110010 00110011     0123
00000034: 00110100 00110101 00110110 00110111     4567
00000038: 00111000 00111001 00111010 00111011     89:;
0000003c: 00111100 00111101 00111110 00111111     <=>?
00000040: 01000000 01000001 01000010 01000011     @ABC
00000044: 01000100 01000101 01000110 01000111     DEFG
00000048: 01001000 01001001 01001010 01001011     HIJK
0000004c: 01001100 01001101 01001110 01001111     LMNO
00000050: 01010000 01010001 01010010 01010011     PQRS
00000054: 01010100 01010101 01010110 01010111     TUVW
00000058: 01011000 01011001 01011010 01011011     XYZ[
0000005c: 01011100 01011101 01011110 01011111     \]^_
00000060: 01100000 01100001 01100010 01100011     `abc
00000064: 01100100 01100101 01100110 01100111     defg
00000068: 01101000 01101001 01101010 01101011     hijk
0000006c: 01101100 01101101 01101110 01101111     lmno
00000070: 01110000 01110001 01110010 01110011     pqrs
00000074: 01110100 01110101 01110110 01110111     tuvw
00000078: 01111000 01111001 01111010 01111011     xyz{
0000007c: 01111100 01111101 01111110 01111111     |}~.
00000080: 10000000 10000001 10000010 10000011     ....
00000084: 10000100 10000101 10000110 10000111     ....
00000088: 10001000 10001001 10001010 10001011     ....
0000008c: 10001100 10001101 10001110 10001111     ....
00000090: 10010000 10010001 10010010 10010011     ....
00000094: 10010100 10010101 10010110 10010111     ....
00000098: 10011000 10011001 10011010 10011011     ....
0000009c: 10011100 10011101 10011110 10011111     ....
000000a0: 10100000 10100001 10100010 10100011     ....
000000a4: 10100100 10100101 10100110 10100111     ....
000000a8: 10101000 10101001 10101010 10101011     ....
000000ac: 10101100 10101101 10101110 10101111     ....
000000b0: 10110000 10110001 10110010 10110011     ....
000000b4: 10110100 10110101 10110110 10110111     ....
000000b8: 10111000 10111001 10111010 10111011     ....
000000bc: 10111100 10111101 10111110 10111111     ....
000000c0: 11000000 11000001 11000010 11000011     ....
000000c4: 11000100 11000101 11000110 11000111     ....
000000c8: 11001000 11001001 11001010 11001011     ....
000000cc: 11001100 11001101 11001110 11001111     ....
000000d0: 11010000 11010001 11010010 11010011     ....
000000d4: 11010100 11010101 11010110 11010111     ....
000000d8: 11011000 11011001 11011010 11011011     ....
000000dc: 11011100 11011101 11011110 11011111     ....
000000e0: 11100000 11100001 11100010 11100011     ....
000000e4: 11100100 11100101 11100110 11100111     ....
000000e8: 11101000 11101001 11101010 11101011     ....
000000ec: 11101100 11101101 11101110 11101111     ....
000000f0: 11110000 11110001 11110010 11110011     ....
000000f4: 11110100 11110101 11110110 11110111     ....
000000f8: 11111000 11111001 11111010 11111011     ....
000000fc: 11111100 11111101 11111110 11111111     ....
]]
    local input = {}
    for i = 0, 255 do
        input[i + 1]  = string.char(i)
    end
    input = table.concat(input)
    assert(bitstring.bindump(input) == expected)
end

local test2 = function()
    local expected = "00000000: 00000000 00000001 00000010              ...\n"
    local input = {}
    for i = 0, 2 do
        input[i + 1]  = string.char(i)
    end
    input = table.concat(input)
    assert(bitstring.bindump(input) == expected)
end

local test3 = function()
    local expected = 
[[00000000: 00000000 00000001 00000010 00000011     ....
00000004: 00000100 00000101 00000110 00000111     ....
00000008: 00001000 00001001 00001010 00001011     ....
0000000c: 00001100 00001101 00001110 00001111     ....
00000010: 00010000 00010001 00010010              ...
]]
    local input = {}
    for i = 0, 18 do
        input[i + 1]  = string.char(i)
    end
    input = table.concat(input)
    assert(bitstring.bindump(input) == expected)
end

local test4 = function()
    local expected = 
[[00000000: 00000000 00000001 00000010 00000011     ....
00000004: 00000100 00000101 00000110 00000111     ....
00000008: 00001000 00001001 00001010 00001011     ....
0000000c: 00001100 00001101                       ..
]]

    local input = {}
    for i = 0, 13 do
        input[i + 1]  = string.char(i)
    end
    input = table.concat(input)
    print(bitstring.bindump(input))
    assert(bitstring.bindump(input) == expected)
end

local test5 = function()
    local expected = 
[[00000000: 00000000 00000001 00000010 00000011     ....
00000004: 00000100 00000101 00000110 00000111     ....
00000008: 00001000 00001001 00001010 00001011     ....
0000000c: 00001100 00001101 00001110 00001111     ....
00000010: 00010000 00010001 00010010 00010011     ....
00000014: 00010100 00010101 00010110 00010111     ....
00000018: 00011000 00011001 00011010              ...
]]
    local input = {}
    for i = 0, 26 do
        input[i + 1]  = string.char(i)
    end
    input = table.concat(input)
    print(bitstring.bindump(input))
    assert(bitstring.bindump(input) == expected)
end

local test6 = function()
    local input = {}
    for i = 0, 32 * 1024 do
        input[i + 1]  = string.char(i % 255)
    end
    input = table.concat(input)
    local result = bitstring.bindump(input)
    local result = bitstring.binstream(input)
    assert(input == bitstring.frombinstream(result))
    assert(#result == #input * 8)
end

local test7 = function()
    local expected = "000000000000000100000010000000110000010000000101000001100000011100001000"
    local input = {}
    for i = 0, 8 do
        input[i + 1]  = string.char(i % 255)
    end
    input = table.concat(input)
    local result = bitstring.binstream(input)
    assert(result == expected)
    assert(bitstring.frombinstream(result) == input)
end

local test8 = function()
    test_helpers.assert_throw(function() bitstring.bindump() end, 
        "string expected")

    test_helpers.assert_throw(function() bitstring.binstream() end,
        "string expected")

    test_helpers.assert_throw(function() bitstring.frombinstream() end,
        "string expected")

    test_helpers.assert_throw(
        function() 
            bitstring.frombinstream("01") 
        end,
        "wrong format")

    test_helpers.assert_throw(
        function() 
            bitstring.frombinstream("1234") 
        end,
        "wrong format")
end

local test9 = function()
    local expected = ""
    local result = bitstring.binstream("")
    assert(result == expected)
    assert(bitstring.frombinstream(result) == "")
    assert(bitstring.bindump("") == "")
end

local run_tests = function()
    --disable_print()
    test_helpers.run_test("test9", test9)
    test_helpers.run_test("test8", test8)
    test_helpers.run_test("test7", test7)
    test_helpers.run_test("test6", test6)
    test_helpers.run_test("test5", test5)
    test_helpers.run_test("test4", test4)
    test_helpers.run_test("test3", test3)
    test_helpers.run_test("test2", test2)
    test_helpers.run_test("test1", test1)
    os.exit(0)
end

 
run_tests()

