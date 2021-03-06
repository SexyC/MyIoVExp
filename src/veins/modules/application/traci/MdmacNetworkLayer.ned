//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package org.car2x.veins.modules.application.traci;
import org.car2x.veins.modules.application.ieee80211p.BaseWaveApplLayer;

//
// This module implements the clustering mechanism for
// Modified Distributed Mobility-Aware Clustering (M-DMAC).
// There is a pure virtual function that must be implemented by
// inheriting cluster modules, which provides the weighting function
// for the particular cluster algorithm being tested.
//
simple MdmacNetworkLayer extends BaseWaveApplLayer
{
   	parameters:
        @class(MdmacNetworkLayer);

    	int initialFreshness = default(10);
    	int freshnessThreshold = default(4);
    	double angleThreshold = default(0.25);	// multiple of PI
    	int hopCount = default(1);
		double sendNearPosibility = default(0.0);
		double sendNodePercent = default(0.0);
		double forwardBufferSize @unit(byte) = default(10MB);
		double packetSentInterval = default(10);
		double packetSentIntervalBeg = default(10);
		double packetLenMin @unit(byte) = default(10kB);
		double packetLenMax @unit(byte) = default(20kB);
    	//double beaconInterval @unit(s) = default(20s);

		// signals
		//@signal[sigOverhead](type="int");
		//@signal[sigHelloOverhead](type="int");
		@signal[sigOverhead](type="long");
		@signal[sigHelloOverhead](type="long");
		@signal[sigSentPkts](type="long");
		@signal[sigRecvPkts](type="long");
		@signal[sigLostPkts](type="long");
		@signal[sigLoadPkts](type="long");
		@signal[sigClusterLifetime](type="double");
		//@signal[sigClusterSize](type="int");
		//@signal[sigHeadChange](type="int");
		//@signal[sigDeathType](type="int");
		//@signal[sigClusterSize](type="long");
		@signal[sigClusterSize](type="double");
		@signal[sigHeadChange](type="long");
		//@signal[sigDeathType](type="long");
		@signal[sigDeathType](type="double");
		@signal[sigDeathX](type="double");
		@signal[sigDeathY](type="double");

		// statistics
		@statistic[       overhead]( source =            sigOverhead; record =  stats; title =                  "Overhead per node"; unit = "bytes" );
		@statistic[  helloOverhead]( source =       sigHelloOverhead; record =  stats; title = "Overhead per node (HELLO messages)"; unit = "bytes" );
		@statistic[clusterLifetime]( source =     sigClusterLifetime; record =  stats; title =                   "Cluster Lifetime"; unit =     "s" );
		@statistic[    clusterSize]( source =         sigClusterSize; record =  stats; title =                       "Cluster Size"; 				);
		@statistic[     headChange]( source = "count(sigHeadChange)"; record =   last; title =                         "CH changes"; 				);
		@statistic[      deathType]( source =           sigDeathType; record = vector; title =                "Cluster Death Types"; 				);
		@statistic[         deathX]( source =              sigDeathX; record = vector; title =           "Cluster Death Position X"; 				);
		@statistic[         deathY]( source =              sigDeathY; record = vector; title =           "Cluster Death Position Y"; 				);
		@statistic[    sigSentPkts]( source =              sigSentPkts; record = stats; title =           "total sent packets"; 				);
		@statistic[    sigRecvPkts]( source =              sigRecvPkts; record = stats; title =           "total recv packets"; 				);
		@statistic[    sigLostPkts]( source =              sigLostPkts; record = stats; title =           "total lost packets"; 				);
		@statistic[    sigLoadPkts]( source =              sigLoadPkts; record = stats; title =           "total load packets"; 				);

}

