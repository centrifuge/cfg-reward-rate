// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.4.23;

import "tinlake-auth/auth.sol";

contract CfgRewardRate is Auth {

    uint256 public investorRewardRate;
    uint256 aoRewardRate;

    event RateUpdate(uint256 newInvestorRewardRate, uint256 newAoRewardRate);

    constructor() {
        wards[msg.sender] = 1;
        emit Rely(msg.sender);
    }

    function get() public view returns (uint256, uint256) {
        return (investorRewardRate, aoRewardRate);
    }
    
    function set(uint256 investorRewardRate_, uint256 aoRewardRate_) public auth {
        investorRewardRate = investorRewardRate_;
        aoRewardRate = aoRewardRate_;
        emit RateUpdate(investorRewardRate, aoRewardRate);
    }

}
