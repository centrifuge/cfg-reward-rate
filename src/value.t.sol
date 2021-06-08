// Copyright (C) 2017  DappHub, LLC

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma solidity >=0.4.23;

import "ds-test/test.sol";
import "./value.sol";

contract TestUser {
    function doSet(CfgRewardRate value, uint256 irr, uint256 aorr) public {
        value.set(irr, aorr);
    }
}

contract CfgRewardRateTest is DSTest {
    CfgRewardRate rewardRate;
    uint256 invRR = 0.0042 * 10**27;
    uint256 aoRR = 0.0015 * 10**27;
    TestUser user;

    function setUp() public {
        rewardRate = new CfgRewardRate();
        user = new TestUser();
    }

    function testSet() public {
        rewardRate.set(invRR, aoRR);
    }

    function testFailSet() public {
        user.doSet(rewardRate, invRR, aoRR);
    }

    function testGet() public {
        rewardRate.set(invRR, aoRR);
        uint256 wut;
        (wut,) = rewardRate.get();
        assertEq(invRR, wut);
    }

}
