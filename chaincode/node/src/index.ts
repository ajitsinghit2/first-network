import shim = require('fabric-shim');
import Firstchaincode from './chaincode';

shim.start(new Firstchaincode());
