// SPDX-License-Identifier: MIT
pragma solidity 0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceFeed {
    AggregatorV3Interface internal priceFeedEth;
    AggregatorV3Interface internal priceFeedUSDC;
    AggregatorV3Interface internal priceFeedBNB;

    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     * Aggregator: USDC/ETH
     * Address: 0x64EaC61A2DFda2c3Fa04eED49AA33D021AeC8838
     * Aggregator: BNB/USD
     * Address: 0x8993ED705cdf5e84D0a3B754b5Ee0e1783fcdF16
     */
    constructor() public {
        priceFeedEth = AggregatorV3Interface(
            0x9326BFA02ADD2366b30bacB125260Af641031331
        );
        priceFeedUSDC = AggregatorV3Interface(
            0x64EaC61A2DFda2c3Fa04eED49AA33D021AeC8838
        );
        priceFeedBNB = AggregatorV3Interface(
            0x8993ED705cdf5e84D0a3B754b5Ee0e1783fcdF16
        );
    }

    /**
     * @dev Returns the latest price for ETH/USD
     * Fiat currency => 8 decimals
     * Crypto currency => 18 decimals
     */
    function ethPerUSD() public view returns (int256) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = priceFeedEth.latestRoundData();
        return price;
    }

    /**
     * @dev Returns the latest price for USDC/ETH
     * Fiat currency => 8 decimals
     * Crypto currency => 18 decimals
     */
    function USDCPerETH() public view returns (int256, uint256) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = priceFeedUSDC.latestRoundData();
        return (price, timeStamp);
    }

    /**
     * @dev Returns the latest price for BNB/USD
     * Fiat currency => 8 decimals
     * Crypto currency => 18 decimals
     */
    function BNBperUSD() public view returns (int256, uint80) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = priceFeedBNB.latestRoundData();
        return (price, answeredInRound);
    }
}
