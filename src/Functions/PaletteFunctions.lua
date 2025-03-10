-- Lospec500 Palette
-- https://lospec.com/palette-list/lospec500

lospecColors = {
	{0.062, 0.070, 0.109}, 	-- 01, #10121c
	{0.172, 0.117, 0.192}, 	-- 02, #2c1e31
	{0.419, 0.149, 0.262}, 	-- 03, #6b2643
	{0.674, 0.156, 0.278}, 	-- 04, #ac2847
	{0.925, 0.152, 0.247}, 	-- 05, #ec273f
	{0.580, 0.286, 0.227}, 	-- 06, #94493a
	{0.870, 0.364, 0.227}, 	-- 07, #de5d3a
	{0.913, 0.521, 0.215}, 	-- 08, #e98537
	{0.952, 0.658, 0.2}, 		-- 09, #f3a833
	{0.301, 0.207, 0.2},		-- 10, #4d3533
	{0.431, 0.298, 0.188},	-- 11, #6e4c30
	{0.635, 0.427, 0.247},	-- 12, #a26d3f
	{0.807, 0.572, 0.282},	-- 13, #ce9248
	{0.854, 0.694, 0.388},	-- 14, #dab163
	{0.909, 0.823, 0.509},	-- 15, #e8d282
	{0.968, 0.952, 0.717},	-- 16, #f7f3b7
	{0.117, 0.250, 0.266},	-- 17, #1e4044
	{0, 0.396, 0.329},			-- 18, #006554
	{0.149, 0.521, 0.298},	-- 19, #26854c
	{0.352, 0.709, 0.321},	-- 20, #5ab552
	{0.615, 0.901, 0.305},	-- 21, #9de64e
	{0, 0.545, 0.545},			-- 22, #008b8b
	{0.384, 0.643, 0.466},	-- 23, #62a477
	{0.650, 0.796, 0.588},	-- 24, #a6cb96
	{0.827, 0.933, 0.827},	-- 25, #d3eed3
	{0.243, 0.231, 0.396},	-- 26, #3e3b65
	{0.219, 0.349, 0.701},	-- 27, #3859b3
	{0.2, 0.533, 0.870},		-- 28, #3388de
	{0.211, 0.772, 0.956},	-- 29, #36c5f4
	{0.427, 0.917, 0.839},	-- 30, #6dead6
	{0.368, 0.356, 0.549},	-- 31, #5e5b8c
	{0.549, 0.470, 0.647},	-- 32, #8c78a5
	{0.690, 0.654, 0.721},	-- 33, #b0a7b8
	{0.870, 0.807, 0.929},	-- 34, #deceed
	{0.603, 0.301, 0.462},	-- 35, #9a4d76
	{0.784, 0.470, 0.686},	-- 36, #c878af
	{0.8, 0.6, 1},					-- 37, #cc99ff
	{0.980, 0.431, 0.474},	-- 38, #fa6e79
	{1, 0.635, 0.674},			-- 39, #ffa2ac
	{1, 0.819, 0.835},			-- 40, #ffd1d5
	{0.964, 0.909, 0.878},	-- 41, #f6e8e0
	{1, 1, 1},							-- 42, #ffffff
}

function setLospecColor(index, alpha)
	love.graphics.setColor(
		lospecColors[index][1],
		lospecColors[index][2],
		lospecColors[index][3],
		alpha or 1
	)
end
