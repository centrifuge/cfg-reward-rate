// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.4.23;

import "ds-test/test.sol";
import "./rate.sol";

contract TestUser {
    function doSet(CfgRewardRate value, uint256 investorRewardRate_, uint256 aoRewardRate_) public {
        value.set(investorRewardRate_, aoRewardRate_);
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
