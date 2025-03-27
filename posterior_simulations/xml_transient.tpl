<!-- Integrated Hydrology w/ Evapotranspiration and Snow -->
<!-- Modified from: https://github.com/amanzi/ats-demos-exasheds-meshes -->

<ParameterList name="Main" type="ParameterList">

  <!-- mesh -->
  <ParameterList name="mesh" type="ParameterList">

    <ParameterList name="surface" type="ParameterList">
      <Parameter name="mesh type" type="string" value="surface" />
      <ParameterList name="surface parameters" type="ParameterList">
        <Parameter name="surface sideset name" type="string" value="surface" />
      </ParameterList>
    </ParameterList>

    <ParameterList name="snow" type="ParameterList">
      <Parameter name="mesh type" type="string" value="aliased" />
      <ParameterList name="aliased parameters" type="ParameterList">
        <Parameter name="target" type="string" value="surface" />
      </ParameterList>
    </ParameterList>

    <ParameterList name="canopy" type="ParameterList">
      <Parameter name="mesh type" type="string" value="aliased" />
      <ParameterList name="aliased parameters" type="ParameterList">
        <Parameter name="target" type="string" value="surface" />
      </ParameterList>
    </ParameterList>
    
    <ParameterList name="domain" type="ParameterList">
      <Parameter name="mesh type" type="string" value="read mesh file" />
      <Parameter name="build columns from set" type="string" value="surface" />
      <ParameterList name="read mesh file parameters" type="ParameterList">
        <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
        <Parameter name="format" type="string" value="Exodus II" />
      </ParameterList>
    </ParameterList>
    
    
  </ParameterList>
  <!-- eo mesh -->

  <!-- regions -->
  <ParameterList name="regions" type="ParameterList">

    <ParameterList name="computational domain">
      <ParameterList name="region: all">
      </ParameterList>
    </ParameterList>
    
    <ParameterList name="surface domain">
      <ParameterList name="region: all">
      </ParameterList>
    </ParameterList>

    <ParameterList name="surface" type="ParameterList">
      <ParameterList name="region: labeled set" type="ParameterList">
        <Parameter name="entity" type="string" value="face"/>
        <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo"/>
        <Parameter name="format" type="string" value="Exodus II"/>
        <Parameter name="label" type="string" value="2"/>
      </ParameterList>
    </ParameterList>

     <ParameterList name="bedrock">
       <ParameterList name="region: labeled set">
         <Parameter name="entity" type="string" value="cell"/>
         <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo"/>
         <Parameter name="format" type="string" value="Exodus II"/>
         <Parameter name="label" type="string" value="999"/>
       </ParameterList>
     </ParameterList>

     <ParameterList name="soils">
       <ParameterList name="region: logical">
         <Parameter name="operation" type="string" value="subtract"/>
         <Parameter name="regions" type="Array(string)" value="{computational domain, bedrock}"/>
       </ParameterList>
     </ParameterList>

     <ParameterList name="surface boundary" type="ParameterList">
       <ParameterList name="region: boundary" type="ParameterList">
       </ParameterList>
     </ParameterList>
     
     <ParameterList name="SUF1">
       <ParameterList name="region: labeled set">
         <Parameter name="entity" type="string" value="FACE"/>
         <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo"/>
         <Parameter name="format" type="string" value="Exodus II"/>
         <Parameter name="label" type="string" value="10001"/>
       </ParameterList>
     </ParameterList>
      
     <ParameterList name="SUF1 boundary">
       <ParameterList name="region: labeled set">
         <Parameter name="entity" type="string" value="FACE"/>
         <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo"/>
         <Parameter name="format" type="string" value="Exodus II"/>
         <Parameter name="label" type="string" value="10002"/>
       </ParameterList>
     </ParameterList>
     
    <ParameterList name="hillslope end surface">
       <ParameterList name="region: labeled set">
         <Parameter name="entity" type="string" value="FACE"/>
         <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo"/>
         <Parameter name="format" type="string" value="Exodus II"/>
         <Parameter name="label" type="string" value="10006"/>
       </ParameterList>
    </ParameterList>

  <!-- Region: Surface properties, land cover, NLCD, {0, 31, 41, 42, 52, 71, 90} -->
  <ParameterList name="None" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="0" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="Barren Land" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="31" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="Deciduous Forest" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="41" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="Evergreen Forest" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="42" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="Shrub/Scrub" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="52" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="Grassland/Herbaceous" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="71" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="Woody Wetlands" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="90" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="FACE" />
  </ParameterList>
  </ParameterList>
  
  <!-- Region: Subsurface properties, Soil data, NRCS, this index is the ATS index {1000,1001,1002}, not the actual mukey in NRCS -->
  <ParameterList name="NRCS1000" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1000" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="NRCS1001" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1001" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="NRCS1002" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1002" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
    <ParameterList name="NRCS1003" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1003" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="NRCS1004" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1004" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="NRCS1005" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1005" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="NRCS1006" type="ParameterList">
  <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="1006" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>

  <!-- Region: Subsurface properties, Geological structure data, NRCS, this index is the ATS index {100,101}, not the actual geol type index in GLHYMPS-->
 <ParameterList name="GLHYMPS100" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="100" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="GLHYMPS101" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="101" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
    <ParameterList name="GLHYMPS102" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="102" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
  <ParameterList name="GLHYMPS103" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="103" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>
    <ParameterList name="GLHYMPS104" type="ParameterList">
    <ParameterList name="region: labeled set" type="ParameterList">
      <Parameter name="label" type="string" value="104" />
      <Parameter name="file" type="string" value="../shared_files/depth_120m_structure1_geophysics.exo" />
      <Parameter name="format" type="string" value="Exodus II" />
      <Parameter name="entity" type="string" value="CELL" />
  </ParameterList>
  </ParameterList>


  </ParameterList>
  <!-- eo regions -->

  <ParameterList name="checkpoint" type="ParameterList">
    <Parameter name="times start period stop" type="Array(double)" value="{0.0, 30.0, -1.0}" />
    <Parameter name="times start period stop units" type="string" value="d"/>
  </ParameterList>
  
  <!-- cycle driver -->
  <ParameterList name="cycle driver" type="ParameterList">
    
    <Parameter name="start time" type="double" value="3560" /> <!--2010-01-01-->
    <Parameter name="start time units" type="string" value="d" />
    <Parameter name="end time" type="double" value="5020"/> <!--2023-09-30-->
    <Parameter name="end time units" type="string" value="d" />
      
    <ParameterList name="required times">
       <Parameter name="times start period stop" type="Array(double)" value="{0, 1.0, -1}" />
       <Parameter name="times start period stop units" type="string" value="d" /> <!--h-->
    </ParameterList>

<!-- This is for loading the checkpoint after the spinup.
   <Parameter name="restart from checkpoint file" type="string" value="./initial/checkpoint_final_sim3.h5"/>
-->
  <!-- Process Kernel PK tree with in cycle driver, later in the PK section we will specify each PK. -->
    <ParameterList name="PK tree" type="ParameterList">
      <ParameterList name="water balance" type="ParameterList">
        <Parameter name="PK type" type="string" value="weak MPC" />
        <ParameterList name="canopy_water" type="ParameterList">
          <Parameter name="PK type" type="string" value="general surface balance" />
        </ParameterList>
        <ParameterList name="snow storage" type="ParameterList">
          <Parameter name="PK type" type="string" value="general surface balance" />
        </ParameterList>
        <ParameterList name="surface-subsurface coupler" type="ParameterList">
          <Parameter name="PK type" type="string" value="coupled water" />
          <ParameterList name="flow" type="ParameterList">
            <Parameter name="PK type" type="string" value="richards flow" />
          </ParameterList>
          <ParameterList name="overland flow" type="ParameterList">
            <Parameter name="PK type" type="string" value="overland flow, pressure basis" />
          </ParameterList>
        </ParameterList>
      </ParameterList>
    </ParameterList>
    
  </ParameterList>
  <!-- eo cycle driver -->

  <!-- Process Kernel PKs -->
  <ParameterList name="PKs" type="ParameterList">
    <ParameterList name="water balance" type="ParameterList">
      <Parameter name="PK type" type="string" value="weak MPC" />
      <Parameter name="PKs order" type="Array(string)" value="{canopy_water, snow storage, surface-subsurface coupler}" />
    </ParameterList>

    <!--canopy storage subblock -->
    <ParameterList name="canopy_water" type="ParameterList">
      <Parameter name="PK type" type="string" value="general surface balance" />
      <Parameter name="primary variable key suffix" type="string" value="water_equivalent" />
      <Parameter name="conserved quantity key suffix" type="string" value="water_content" />
      <Parameter name="domain name" type="string" value="canopy" />
      <Parameter name="source term" type="bool" value="true" />
      <Parameter name="source key suffix" type="string" value="water_source" />
      <Parameter name="source term is differentiable" type="bool" value="true" />
      <Parameter name="modify predictor positivity preserving" type="bool" value="true" />
      <Parameter name="initial time step" type="double" value="86400.0" />

      <Parameter name="debug cells" type="Array(int)" value="{}" />
      <ParameterList name="verbose object" type="ParameterList">
        <Parameter name="verbosity level" type="string" value="medium" />
      </ParameterList>

      <ParameterList name="initial condition" type="ParameterList">
        <Parameter name="restart file" type="string" value="../shared_files/structure1_20191001.h5"/>
      </ParameterList>
        
      <ParameterList name="inverse" type="ParameterList">
        <Parameter name="preconditioning method" type="string" value="diagonal" />
      </ParameterList>

      <ParameterList name="time integrator" type="ParameterList">
        <Parameter name="extrapolate initial guess" type="bool" value="true" />
        <Parameter name="solver type" type="string" value="nka_bt_ats" />
        <Parameter name="timestep controller type" type="string" value="smarter" />
        <ParameterList name="nka_bt_ats parameters" type="ParameterList">
          <Parameter name="nka lag iterations" type="int" value="2" />
          <Parameter name="max backtrack steps" type="int" value="5" />
          <Parameter name="backtrack lag" type="int" value="0" />
          <Parameter name="backtrack factor" type="double" value="0.5" />
          <Parameter name="backtrack tolerance" type="double" value="0.0001" />
          <Parameter name="nonlinear tolerance" type="double" value="1e-06" />
          <Parameter name="diverged tolerance" type="double" value="1000000.0" />
          <Parameter name="limit iterations" type="int" value="21" />
          <ParameterList name="verbose object" type="ParameterList">
            <Parameter name="verbosity level" type="string" value="low" />
          </ParameterList>
        </ParameterList>
        <ParameterList name="verbose object" type="ParameterList">
          <Parameter name="verbosity level" type="string" value="low" />
        </ParameterList>
        <ParameterList name="timestep controller smarter parameters" type="ParameterList">
          <Parameter name="max iterations" type="int" value="18" />
          <Parameter name="min iterations" type="int" value="10" />
          <Parameter name="time step reduction factor" type="double" value="0.5" />
          <Parameter name="time step increase factor" type="double" value="2.0" />
          <Parameter name="max time step" type="double" value="10000000.0" />
          <Parameter name="min time step" type="double" value="1e-10" />
          <Parameter name="growth wait after fail" type="int" value="2" />
          <Parameter name="count before increasing increase factor" type="int" value="2" />
        </ParameterList>
      </ParameterList>
    </ParameterList> 

    <!-- snow storage -->
    <ParameterList name="snow storage" type="ParameterList">
      <Parameter name="PK type" type="string" value="general surface balance" />
      <Parameter name="primary variable key" type="string" value="snow-depth" />
      <Parameter name="conserved quantity key" type="string" value="snow-water_content" />
      <Parameter name="domain name" type="string" value="snow" />
      <Parameter name="source term" type="bool" value="true" />
      <Parameter name="source key" type="string" value="snow-water_source" />
      <Parameter name="modify predictor positivity preserving" type="bool" value="true" />
      <Parameter name="initial time step" type="double" value="0.15" />

      <ParameterList name="initial condition" type="ParameterList">
        <Parameter name="restart file" type="string" value="../shared_files/structure1_20191001.h5"/>
      </ParameterList>
     <!--
     <ParameterList name="initial condition" type="ParameterList">
        <Parameter name="restart file" type="string" value="checkpoint_final_sim3.h5"/>
      </ParameterList>
    --> 
      <ParameterList name="preconditioner" type="ParameterList">
        <Parameter name="preconditioner type" type="string" value="block ilu" />
      </ParameterList>
      <ParameterList name="time integrator" type="ParameterList">
        <Parameter name="extrapolate initial guess" type="bool" value="true" />
        <Parameter name="solver type" type="string" value="nka_bt_ats" />
        <Parameter name="timestep controller type" type="string" value="smarter" />
        <ParameterList name="nka_bt_ats parameters" type="ParameterList">
          <Parameter name="nka lag iterations" type="int" value="2" />
          <Parameter name="max backtrack steps" type="int" value="5" />
          <Parameter name="backtrack lag" type="int" value="0" />
          <Parameter name="backtrack factor" type="double" value="0.5" />
          <Parameter name="backtrack tolerance" type="double" value="0.0001" />
          <Parameter name="nonlinear tolerance" type="double" value="1e-06" />
          <Parameter name="diverged tolerance" type="double" value="1000000.0" />
          <Parameter name="limit iterations" type="int" value="21" />
          <ParameterList name="verbose object" type="ParameterList">
            <Parameter name="verbosity level" type="string" value="high" />
          </ParameterList>
        </ParameterList>
        <ParameterList name="verbose object" type="ParameterList">
          <Parameter name="verbosity level" type="string" value="high" />
        </ParameterList>
        <ParameterList name="timestep controller smarter parameters" type="ParameterList">
          <Parameter name="max iterations" type="int" value="18" />
          <Parameter name="min iterations" type="int" value="10" />
          <Parameter name="time step reduction factor" type="double" value="0.5" />
          <Parameter name="time step increase factor" type="double" value="2.0" />
          <Parameter name="max time step" type="double" value="10000000.0" />
          <Parameter name="min time step" type="double" value="1e-10" />
          <Parameter name="growth wait after fail" type="int" value="2" />
          <Parameter name="count before increasing increase factor" type="int" value="2" />
        </ParameterList>
      </ParameterList>
    </ParameterList>
    <!-- eo snow storage -->

    <!-- surface-subsurface coupler -->
    <ParameterList name="surface-subsurface coupler" type="ParameterList">
      <Parameter name="PK type" type="string" value="coupled water" />
      <Parameter name="PKs order" type="Array(string)" value="{flow, overland flow}" />
      <ParameterList name="water delegate" type="ParameterList">
        <Parameter name="modify predictor damp and cap the water spurt" type="bool" value="true" />
        <Parameter name="damp and cap the water spurt" type="bool" value="true" />
        <Parameter name="cap over atmospheric" type="double" value="0.001" />
        <ParameterList name="verbose object" type="ParameterList">
          <Parameter name="verbosity level" type="string" value="high" />
        </ParameterList>
      </ParameterList>

      <ParameterList name="inverse" type="ParameterList">
        <Parameter name="preconditioning method" type="string" value="block ilu" />
        <Parameter name="iterative method" type="string" value="gmres" />
        <ParameterList name="boomer amg parameters" type="ParameterList">
          <Parameter name="cycle iterations" type="int" value="1" />
          <Parameter name="smoother sweeps" type="int" value="1" />
          <Parameter name="strong threshold" type="double" value="0.85" />
          <Parameter name="tolerance" type="double" value="0.0" />
        </ParameterList>
        <ParameterList name="verbose object" type="ParameterList">
          <Parameter name="verbosity level" type="string" value="low" />
        </ParameterList>
       
        <ParameterList name="gmres parameters" type="ParameterList">
          <Parameter name="preconditioning strategy" type="string" value="left" />
          <Parameter name="error tolerance" type="double" value="1e-06" />
          <Parameter name="convergence criteria" type="Array(string)" value="{relative residual,make one iteration}" />
          <Parameter name="maximum number of iteration" type="int" value="10" />
        </ParameterList>
      </ParameterList>

      <ParameterList name="verbose object" type="ParameterList">
        <Parameter name="verbosity level" type="string" value="medium" />
      </ParameterList>

      <ParameterList name="time integrator" type="ParameterList">
        <Parameter name="extrapolate initial guess" type="bool" value="true" />
        <Parameter name="solver type" type="string" value="nka_bt_ats" />
        <Parameter name="timestep controller type" type="string" value="smarter" />
        <ParameterList name="nka_bt_ats parameters" type="ParameterList">
          <Parameter name="nka lag iterations" type="int" value="2" />
          <Parameter name="max backtrack steps" type="int" value="5" />
          <Parameter name="backtrack lag" type="int" value="0" />
          <Parameter name="backtrack factor" type="double" value="0.5" />
          <Parameter name="backtrack tolerance" type="double" value="0.0001" />
          <Parameter name="nonlinear tolerance" type="double" value="1e-06" />
          <Parameter name="diverged tolerance" type="double" value="1000000.0" />
          <Parameter name="limit iterations" type="int" value="21" />
          <ParameterList name="verbose object" type="ParameterList">
            <Parameter name="verbosity level" type="string" value="high" />
          </ParameterList>
        </ParameterList>
        <ParameterList name="verbose object" type="ParameterList">
          <Parameter name="verbosity level" type="string" value="high" />
        </ParameterList>
        <ParameterList name="timestep controller smarter parameters" type="ParameterList">
          <Parameter name="max iterations" type="int" value="18" />
          <Parameter name="min iterations" type="int" value="10" />
          <Parameter name="time step reduction factor" type="double" value="0.5" />
          <Parameter name="time step increase factor" type="double" value="2.0" />
          <Parameter name="max time step" type="double" value="10000000.0" />
          <Parameter name="min time step" type="double" value="1e-10" />
          <Parameter name="growth wait after fail" type="int" value="2" />
          <Parameter name="count before increasing increase factor" type="int" value="2" />
        </ParameterList>
      </ParameterList>
    </ParameterList>
    <!-- eo surface-subsurface coupler -->

    <!-- flow -->
    <ParameterList name="flow" type="ParameterList">
      <Parameter name="PK type" type="string" value="richards flow" />
      <Parameter name="primary variable key" type="string" value="pressure" />
      <Parameter name="source term" type="bool" value="true" />
      <Parameter name="source key" type="string" value="water_source" />
      <Parameter name="initial time step" type="double" value="0.15" />
      <Parameter name="permeability rescaling" type="double" value="10000000.0" />
      <Parameter name="clobber surface rel perm" type="bool" value="false" />
      <Parameter name="relative permeability method" type="string" value="upwind with Darcy flux" />
      <Parameter name="debug cells" type="Array(int)" value="{}" />
      <ParameterList name="verbose object" type="ParameterList">
        <Parameter name="verbosity level" type="string" value="high" />
      </ParameterList>
      <ParameterList name="diffusion" type="ParameterList">
        <Parameter name="discretization primary" type="string" value="mfd: two-point flux approximation" />
      </ParameterList>
      <ParameterList name="diffusion preconditioner">
        <Parameter name="include Newton correction" type="bool" value="true" />
      </ParameterList>
      <ParameterList name="boundary conditions" type="ParameterList">
       <ParameterList name="head">
         <ParameterList name="hillslope end">
           <Parameter name="regions" type="Array(string)" value="{hillslope end surface}"/>
           <ParameterList name="boundary head">
             <ParameterList name="function-constant">
               <Parameter name="value" type="double" value="0.01"/>
             </ParameterList>
           </ParameterList>
         </ParameterList>
       </ParameterList>
      </ParameterList>
        

      <ParameterList name="initial condition" type="ParameterList">
        <Parameter name="restart file" type="string" value="../shared_files/structure1_20191001.h5"/>
      </ParameterList>
      <!--        
      <ParameterList name="initial condition" type="ParameterList">
        <Parameter name="restart file" type="string" value="checkpoint_final_sim3.h5"/>
      </ParameterList>
      --> 
      <ParameterList name="water retention evaluator" type="ParameterList">
        <Parameter name="minimum rel perm cutoff" type="double" value="0.0" />
        <Parameter name="use surface rel perm" type="bool" value="true" />
        <ParameterList name="WRM parameters" type="ParameterList">

<!-- water Retention curves-->
  <ParameterList name="bedrock" type="ParameterList">
    <Parameter name="region" type="string" value="bedrock" />
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="2e-05" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.58" />
    <Parameter name="residual saturation [-]" type="double" value="0.2" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1000" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1000" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.548169485" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.00020210213246762894" />
    <Parameter name="residual saturation [-]" type="double" value="0.16956714997" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1001" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1001" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.4476994773724485" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="4.486203921990202e-05" />
    <Parameter name="residual saturation [-]" type="double" value="0.2187409164026666" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1002" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1002" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.7620720161029444" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.000220528" />
    <Parameter name="residual saturation [-]" type="double" value="0.15736573141848026" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1003" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1003" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.5342594997496" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.0001853211930584191" />
    <Parameter name="residual saturation [-]" type="double" value="0.1686736937613602" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1004" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1004" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.362910338" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="5.84e-05" />
    <Parameter name="residual saturation [-]" type="double" value="0.253242953" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1005" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1005" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.5176402454962006" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.00017328024772538165" />
    <Parameter name="residual saturation [-]" type="double" value="0.15923611445650288" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="NRCS1006" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="NRCS1006" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.367408264" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.000140372" />
    <Parameter name="residual saturation [-]" type="double" value="0.220962202" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="GLHYMPS100" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="GLHYMPS100" />
    <Parameter name="van Genuchten n [-]" type="double" value="1.58" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="2e-05" />
    <Parameter name="residual saturation [-]" type="double" value="0.2" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="GLHYMPS101" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="GLHYMPS101" />
    <Parameter name="van Genuchten n [-]" type="double" value="2.0" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.0008170165079009431" />
    <Parameter name="residual saturation [-]" type="double" value="0.01" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
    <ParameterList name="GLHYMPS102" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="GLHYMPS102" />
    <Parameter name="van Genuchten n [-]" type="double" value="2.0" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="2.51174349e-05" />
    <Parameter name="residual saturation [-]" type="double" value="0.01" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="GLHYMPS103" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="GLHYMPS103" />
    <Parameter name="van Genuchten n [-]" type="double" value="2.0" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="2.51174349e-05" />
    <Parameter name="residual saturation [-]" type="double" value="0.01" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>
  <ParameterList name="GLHYMPS104" type="ParameterList">
    <Parameter name="WRM Type" type="string" value="van Genuchten" />
    <Parameter name="region" type="string" value="GLHYMPS104" />
    <Parameter name="van Genuchten n [-]" type="double" value="2.0" />
    <Parameter name="van Genuchten alpha [Pa^-1]" type="double" value="0.0008170165079009431" />
    <Parameter name="residual saturation [-]" type="double" value="0.01" />
    <Parameter name="smoothing interval width [saturation]" type="double" value="0.05" />
  </ParameterList>

        </ParameterList>
        <ParameterList name="verbose object" type="ParameterList">
          <Parameter name="verbosity level" type="string" value="high" />
        </ParameterList>
      </ParameterList>
    </ParameterList>
    <!-- eo flow -->

    <!-- overland flow -->
    <ParameterList name="overland flow" type="ParameterList">
      <Parameter name="pk type" type="string" value="overland flow, pressure basis" />
      <Parameter name="primary variable key" type="string" value="surface-pressure" />
      <Parameter name="domain name" type="string" value="surface" />
      <Parameter name="source term" type="bool" value="true" />
      <Parameter name="source key" type="string" value="surface-water_source" />
      <Parameter name="mass source in meters" type="bool" value="true" />
      <Parameter name="initial time step" type="double" value="0.05" />
      <Parameter name="debug cells" type="Array(int)" value="{643,1648}" />
      <ParameterList name="verbose object" type="ParameterList">
        <Parameter name="verbosity level" type="string" value="low" />
      </ParameterList>
      <ParameterList name="diffusion" type="ParameterList">
        <Parameter name="discretization primary" type="string" value="fv: default" />
      </ParameterList>
      <ParameterList name="diffusion preconditioner" type="ParameterList">

        <Parameter name="include newton correction" type="bool" value="true" />
      </ParameterList>

      <ParameterList name="boundary conditions" type="ParameterList">
        <ParameterList name="seepage face head">
          <ParameterList name="surface">
            <Parameter name="regions" type="Array(string)" value="{surface boundary}" />
            <ParameterList name="boundary head">
              <ParameterList name="function-constant">
                <Parameter name="value" type="double" value="0.5" />
              </ParameterList>
            </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>
      
      <ParameterList name="initial condition" type="ParameterList">
        <Parameter name="initialize surface head from subsurface" type="bool" value="true" />
      </ParameterList>

      <ParameterList name="overland conductivity evaluator" type="ParameterList">
        <ParameterList name="overland conductivity model" type="ParameterList">
          <Parameter name="overland conductivity type " type="string" value="manning" />
          <Parameter name="manning exponent" type="double" value="0.666666666667" />
          <Parameter name="slope regularization epsilon" type="double" value="0.01" />
        </ParameterList>
      </ParameterList>
    </ParameterList>
    <!-- eo overland flow -->

  </ParameterList>
  <!-- eo pk -->

  <!-- state -->
  <ParameterList name="state" type="ParameterList">

    <ParameterList name="evaluators" type="ParameterList">
    <!-- evaluators -->

      <ParameterList name="water_content" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="richards water content" />
        <Parameter name="units" type="string" value="mol" />
      </ParameterList>

      <ParameterList name="capillary_pressure_gas_liq" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="capillary pressure, atmospheric gas over liquid" />
        <Parameter name="units" type="string" value="pa" />
      </ParameterList>

      <ParameterList name="surface-water_content" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="overland pressure water content" />
        <Parameter name="units" type="string" value="mol" />
      </ParameterList>

      <ParameterList name="surface-ponded_depth" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="ponded depth" />
        <Parameter name="units" type="string" value="m" />
      </ParameterList>

      <ParameterList name="snow-water_content" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="multiplicative evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{snow-cell_volume, snow-water_equivalent, surface-molar_density_liquid}" />
        <Parameter name="units" type="string" value="mol" />
      </ParameterList>

      <ParameterList name="canopy-water_content" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="multiplicative evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-cell_volume, canopy-water_equivalent, surface-molar_density_liquid}" />
        <Parameter name="units" type="string" value="mol" />
      </ParameterList>

      <ParameterList name="canopy-water_source" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="multiplicative evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-water_source_meters, surface-molar_density_liquid}" />
        <Parameter name="units" type="string" value="mol m^-2 s^-1" />
      </ParameterList>

      <ParameterList name="canopy-water_source_meters" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="additive evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-interception, canopy-evaporation, canopy-drainage}" />
        <Parameter name="canopy-evaporation coefficient" type="double" value="-1" />
        <Parameter name="canopy-drainage coefficient" type="double" value="-1" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="canopy-interception" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="interception fraction" />
        <Parameter name="area index key" type="string" value="canopy-leaf_area_index" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="canopy-fracwet" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="canopy drainage" />
        <Parameter name="drainage key" type="string" value="canopy-drainage" />
        <Parameter name="fraction wet key" type="string" value="canopy-fracwet" />
        <Parameter name="area index key" type="string" value="canopy-leaf_area_index" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="canopy-evaporation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="potential evapotranspiration, Priestley-Taylor" />
        <Parameter name="evaporation type" type="string" value="canopy" />
        <Parameter name="include limiter" type="bool" value="true" />
        <Parameter name="air temperature key" type="string" value="surface-air_temperature" />
        <Parameter name="surface temperature key" type="string" value="surface-air_temperature" />
        <Parameter name="relative humidity key" type="string" value="surface-relative_humidity" />
        <Parameter name="elevation key" type="string" value="surface-elevation" />
        <Parameter name="net radiation key" type="string" value="canopy-radiation_balance" />
        <Parameter name="limiter key" type="string" value="canopy-fracwet" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="canopy-radiation_balance" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="radiation balance, surface and canopy" />
        <Parameter name="surface albedos key" type="string" value="surface-albedos" />
        <Parameter name="surface emissivities key" type="string" value="surface-emissivities" />
        <Parameter name="surface temperature key" type="string" value="surface-temperature" />
        <Parameter name="snow temperature key" type="string" value="surface-temperature" />
        <Parameter name="canopy temperature key" type="string" value="surface-temperature" />
        <Parameter name="incoming shortwave radiation key" type="string" value="surface-incident_shortwave_radiation" />
        <Parameter name="incoming longwave radiation key" type="string" value="surface-incoming_longwave_radiation" />
        <Parameter name="area fractions key" type="string" value="surface-area_fractions" />
        <Parameter name="leaf area index key" type="string" value="canopy-leaf_area_index" />
        <Parameter name="units" type="string" value="w m^-2" />
      </ParameterList>

      <ParameterList name="snow-water_source" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="multiplicative evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{snow-water_source_meters, surface-molar_density_liquid}" />
        <Parameter name="units" type="string" value="mol m^-2 s^-1" />
      </ParameterList>

      <ParameterList name="snow-water_source_meters" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="additive evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-throughfall_drainage_snow, snow-melt, snow-evaporation}" />
        <Parameter name="snow-evaporation coefficient" type="double" value="-1" />
        <Parameter name="snow-melt coefficient" type="double" value="-1" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>
        
      <ParameterList name="air-snow_temperature_difference">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="0" />
        <Parameter name="units" type="string" value="K" />
      </ParameterList>
        
      <ParameterList name="snow-expected_temperature" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="additive evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{surface-air_temperature,air-snow_temperature_difference}" />
        <Parameter name="air-snow_temperature_difference coefficient" type="double" value="-1" />
        <Parameter name="units" type="string" value="K" />
      </ParameterList>
        
      <ParameterList name="snow-melt" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="snow melt rate" />
        <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="snow-evaporation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="potential evapotranspiration, Priestley-Taylor" />
        <Parameter name="evaporation type" type="string" value="snow" />
        <Parameter name="include limiter" type="bool" value="true" />
        <Parameter name="limiter number of dofs" type="int" value="2" />
        <Parameter name="limiter dof" type="int" value="1" />
        <Parameter name="air temperature key" type="string" value="surface-air_temperature" />
        <Parameter name="surface temperature key" type="string" value="surface-temperature" />
        <Parameter name="relative humidity key" type="string" value="surface-relative_humidity" />
        <Parameter name="elevation key" type="string" value="surface-elevation" />
        <Parameter name="net radiation key" type="string" value="snow-radiation_balance" />
        <Parameter name="limiter key" type="string" value="surface-area_fractions" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="surface-area_fractions" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="area fractions, two components" />
        <Parameter name="units" type="string" value="-" />
      </ParameterList>

      <ParameterList name="snow-density">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="150" />
        <Parameter name="units" type="string" value="kg m^-3" />
      </ParameterList>

      <ParameterList name="snow-water_equivalent">
        <Parameter name="evaluator type" type="string" value="multiplicative evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{snow-depth, snow-density}" />
        <Parameter name="coefficient" type="double" value="0.001" />
        <Parameter name="units" type="string" value="m" />
      </ParameterList>

      <ParameterList name="surface-water_source" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="additive evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-throughfall_drainage_rain, snow-melt, surface-evaporation}" />
        <Parameter name="surface-evaporation coefficient" type="double" value="-1" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <!-- evaporation from bare ground -->
      <ParameterList name="surface-evaporation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="evaporation downregulation via soil resistance" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="surface-potential_evaporation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="potential evapotranspiration, Priestley-Taylor" />
        <Parameter name="evaporation type" type="string" value="bare ground" />
        <Parameter name="include limiter" type="bool" value="true" />
        <Parameter name="limiter number of dofs" type="int" value="2" />
        <Parameter name="limiter dof" type="int" value="0" />
        <Parameter name="air temperature key" type="string" value="surface-air_temperature" />
        <Parameter name="surface temperature key" type="string" value="surface-temperature" />
        <Parameter name="relative humidity key" type="string" value="surface-relative_humidity" />
        <Parameter name="elevation key" type="string" value="surface-elevation" />
        <Parameter name="net radiation key" type="string" value="surface-radiation_balance" />
        <Parameter name="limiter key" type="string" value="surface-area_fractions" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <!-- albedo and emissivities of snow and bare ground -->
      <ParameterList name="surface-albedos" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="subgrid albedos, two components" />
      </ParameterList>

      <!-- not considering freeze-thaw here, but still needed by albedo -->
      <ParameterList name="surface-unfrozen_fraction">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value=" 1" />
      </ParameterList>

      <!-- subsurface sink : transpiration -->
      <ParameterList name="water_source" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="additive evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{transpiration}" />
        <Parameter name="transpiration coefficient" type="double" value="-1" />
      </ParameterList>

      <ParameterList name="transpiration" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="transpiration distribution via rooting depth" />
        <Parameter name="potential transpiration key" type="string" value="canopy-potential_transpiration_mols" />
      </ParameterList>
      <ParameterList name="plant_wilting_factor" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="plant wilting factor" />
      </ParameterList>
<!--       <ParameterList name="root_fraction" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="root fraction" />
      </ParameterList> -->
      
      <ParameterList name="rooting_depth_fraction" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="rooting depth fraction" />
      </ParameterList>
      
      <ParameterList name="canopy-potential_transpiration_mols" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="multiplicative evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-potential_transpiration,surface-molar_density_liquid}" />
      </ParameterList>

      <ParameterList name="canopy-potential_transpiration" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="potential evapotranspiration, Priestley-Taylor" />
        <Parameter name="evaporation type" type="string" value="transpiration" />
        <Parameter name="include 1 - limiter" type="bool" value="true" />
        <Parameter name="air temperature key" type="string" value="surface-air_temperature" />
        <Parameter name="surface temperature key" type="string" value="surface-air_temperature" />
        <Parameter name="elevation key" type="string" value="surface-elevation" />
        <Parameter name="net radiation key" type="string" value="canopy-radiation_balance" />
        <Parameter name="1 - limiter key" type="string" value="canopy-fracwet" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="surface-transpiration" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="column sum evaluator" />
        <Parameter name="evaluator dependency key" type="string" value="transpiration" />
        <Parameter name="divide by density" type="bool" value="true" />
        <Parameter name="include volume to surface area factor" type="bool" value="true" />
      </ParameterList>

      <ParameterList name="surface-total_evapotranspiration" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="additive evaluator" />
        <Parameter name="dependencies" type="Array(string)" value="{canopy-evaporation,snow-evaporation, surface-evaporation, surface-transpiration}" />
      </ParameterList>

      <ParameterList name="surface-incident_shortwave_radiation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="incident shortwave radiation" />
        <ParameterList name="incident shortwave radiation parameters" type="ParameterList">
          <Parameter name="daily averaged" type="bool" value="true" />
          <Parameter name="latitude [degrees]" type="double" value="39" />
        </ParameterList>
      </ParameterList>

      <ParameterList name="surface-incoming_longwave_radiation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="incoming longwave radiation" />
      </ParameterList>

      <ParameterList name="depth" type="ParameterList">
        <Parameter name="constant in time" type="bool" value="true" />
        <Parameter name="evaluator type" type="string" value="depth" />
      </ParameterList>

      <ParameterList name="surface-manning_coefficient">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="0.15" />
      </ParameterList>


      <!-- prescribed LAI -->
      <ParameterList name="canopy-leaf_area_index" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">

          <ParameterList name="None" type="ParameterList">
                <Parameter name="region" type="string" value="None" />
                <Parameter name="component" type="string" value="cell" />
                <ParameterList name="function" type="ParameterList">
                  <ParameterList name="function-constant" type="ParameterList">
                    <Parameter name="value" type="double" value="0.00001" />
                  </ParameterList>
                </ParameterList>
              </ParameterList>

              <ParameterList name="Barren Land" type="ParameterList">
              <Parameter name="region" type="string" value="Woody Wetlands" />
              <Parameter name="component" type="string" value="cell" />
              <ParameterList name="function" type="ParameterList">
                <ParameterList name="function-composition" type="ParameterList">
                  <ParameterList name="function1" type="ParameterList">
                    <ParameterList name="function-tabular" type="ParameterList">
                     <Parameter name="file" type="string" value="../shared_files/snodgrass_MODIS_LAI_20100101_20230930.h5" />
                     <Parameter name="x header" type="string" value="time [s]" />
                     <Parameter name="y header" type="string" value="NLCD Barren Land LAI [-]" />
                    </ParameterList>
                  </ParameterList>
                  <ParameterList name="function2" type="ParameterList">
                    <ParameterList name="function-standard-math" type="ParameterList">
                      <Parameter name="operator" type="string" value="mod" />
                      <Parameter name="parameter" type="double" value="31536000" />  
                    </ParameterList>
                  </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>

             <ParameterList name="Woody Wetlands" type="ParameterList">
              <Parameter name="region" type="string" value="Woody Wetlands" />
              <Parameter name="component" type="string" value="cell" />
              <ParameterList name="function" type="ParameterList">
                <ParameterList name="function-composition" type="ParameterList">
                  <ParameterList name="function1" type="ParameterList">
                    <ParameterList name="function-tabular" type="ParameterList">
                     <Parameter name="file" type="string" value="../shared_files/snodgrass_MODIS_LAI_20100101_20230930.h5" />
                     <Parameter name="x header" type="string" value="time [s]" />
                     <Parameter name="y header" type="string" value="NLCD Woody Wetlands LAI [-]" />
                    </ParameterList>
                  </ParameterList>
                  <ParameterList name="function2" type="ParameterList">
                    <ParameterList name="function-standard-math" type="ParameterList">
                      <Parameter name="operator" type="string" value="mod" />
                      <Parameter name="parameter" type="double" value="31536000" />  
                    </ParameterList>
                  </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>


           <ParameterList name="Shrub/Scrub" type="ParameterList">
            <Parameter name="region" type="string" value="Shrub/Scrub" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">
              <ParameterList name="function-composition" type="ParameterList">
                <ParameterList name="function1" type="ParameterList">
                  <ParameterList name="function-tabular" type="ParameterList">
                   <Parameter name="file" type="string" value="../shared_files/snodgrass_MODIS_LAI_20100101_20230930.h5" />
                   <Parameter name="x header" type="string" value="time [s]" />
                   <Parameter name="y header" type="string" value="NLCD Shrub Scrub LAI [-]" />
                  </ParameterList>
                </ParameterList>
                <ParameterList name="function2" type="ParameterList">
                  <ParameterList name="function-standard-math" type="ParameterList">
                    <Parameter name="operator" type="string" value="mod" />
                    <Parameter name="parameter" type="double" value="31536000" />  
                  </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>
          </ParameterList>
              
        
          <ParameterList name="Evergreen Forest" type="ParameterList">
            <Parameter name="region" type="string" value="Evergreen Forest" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">
              <ParameterList name="function-composition" type="ParameterList">
                <ParameterList name="function1" type="ParameterList">
                  <ParameterList name="function-tabular" type="ParameterList">
                   <Parameter name="file" type="string" value="../shared_files/snodgrass_MODIS_LAI_20100101_20230930.h5" />
                   <Parameter name="x header" type="string" value="time [s]" />
                   <Parameter name="y header" type="string" value="NLCD Evergreen forest LAI [-]" />
                  </ParameterList>
                </ParameterList>
                <ParameterList name="function2" type="ParameterList">
                  <ParameterList name="function-standard-math" type="ParameterList">
                    <Parameter name="operator" type="string" value="mod" />
                    <Parameter name="parameter" type="double" value="31536000" />  
                  </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>
          </ParameterList>

          <ParameterList name="Deciduous Forest" type="ParameterList">
            <Parameter name="region" type="string" value="Deciduous Forest" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">
              <ParameterList name="function-composition" type="ParameterList">
                <ParameterList name="function1" type="ParameterList">
                  <ParameterList name="function-tabular" type="ParameterList">
                   <Parameter name="file" type="string" value="../shared_files/snodgrass_MODIS_LAI_20100101_20230930.h5" />
                   <Parameter name="x header" type="string" value="time [s]" />
                   <Parameter name="y header" type="string" value="NLCD Deciduous forest LAI [-]" />
                  </ParameterList>
                </ParameterList>
                <ParameterList name="function2" type="ParameterList">
                  <ParameterList name="function-standard-math" type="ParameterList">
                    <Parameter name="operator" type="string" value="mod" />
                    <Parameter name="parameter" type="double" value="31536000" />
                  </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>
          </ParameterList>
  
          <ParameterList name="Grassland/Herbaceous" type="ParameterList">
            <Parameter name="region" type="string" value="Grassland/Herbaceous" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">
              <ParameterList name="function-composition" type="ParameterList">
                <ParameterList name="function1" type="ParameterList">
                  <ParameterList name="function-tabular" type="ParameterList">
                   <Parameter name="file" type="string" value="../shared_files/snodgrass_MODIS_LAI_20100101_20230930.h5" />
                   <Parameter name="x header" type="string" value="time [s]" />
                   <Parameter name="y header" type="string" value="NLCD Grassland Herbaceous LAI [-]" />
                  </ParameterList>
                </ParameterList>
                <ParameterList name="function2" type="ParameterList">
                  <ParameterList name="function-standard-math" type="ParameterList">
                    <Parameter name="operator" type="string" value="mod" />
                    <Parameter name="parameter" type="double" value="31536000" />  
                  </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>
          </ParameterList>
        
        </ParameterList>
      </ParameterList>    

     <ParameterList name="surface-precipitation_rain" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">
          <ParameterList name="domain" type="ParameterList">
            <Parameter name="region" type="string" value="surface domain" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">
        
        <ParameterList name="function-bilinear-and-time" type="ParameterList">
        <Parameter name="file" type="string" value="../shared_files/watershed_daymet-ats-2010-01-01_2023-12-31.h5"/>
        <Parameter name="row header" type="string" value="y [m]"/>
        <Parameter name="row coordinate" type="string" value="y"/>
        <Parameter name="column header" type="string" value="x [m]"/>
        <Parameter name="column coordinate" type="string" value="x"/>
        <Parameter name="time header" type="string" value="time [s]"/>
        <Parameter name="value header" type="string" value="precipitation rain [m s^-1]"/>
        </ParameterList>
      
            </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>

      <ParameterList name="snow-precipitation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">
          <ParameterList name="domain" type="ParameterList">
            <Parameter name="region" type="string" value="surface domain" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">

        <ParameterList name="function-bilinear-and-time" type="ParameterList">
        <Parameter name="file" type="string" value="../shared_files/watershed_daymet-ats-2010-01-01_2023-12-31.h5"/>
        <Parameter name="row header" type="string" value="y [m]"/>
        <Parameter name="row coordinate" type="string" value="y"/>
        <Parameter name="column header" type="string" value="x [m]"/>
        <Parameter name="column coordinate" type="string" value="x"/>
        <Parameter name="time header" type="string" value="time [s]"/>
        <Parameter name="value header" type="string" value="precipitation snow [m SWE s^-1]"/>
        </ParameterList>

            </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>
    
       <!-- surface temperature is assumed to be yesterday's air temperature, based on PRMS approach -->
      <ParameterList name="surface-temperature" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">
          <ParameterList name="surface" type="ParameterList">
            <Parameter name="region" type="string" value="surface domain" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">
                
                <ParameterList name="function-composition" type="ParameterList">
                <ParameterList name="function1" type="ParameterList">
                   <ParameterList name="function-bilinear-and-time" type="ParameterList">
                    <Parameter name="file" type="string" value="../shared_files/watershed_daymet-ats-2010-01-01_2023-12-31.h5" />
                    <Parameter name="row header" type="string" value="y [m]" />
                    <Parameter name="column header" type="string" value="x [m]" />
                    <Parameter name="row coordinate" type="string" value="y" />             
                    <Parameter name="column coordinate" type="string" value="x" />  
                    <Parameter name="time header" type="string" value="time [s]" />
                    <Parameter name="value header" type="string" value="air temperature [K]" />
                   </ParameterList>
                </ParameterList>
                <ParameterList name="function2" type="ParameterList">
                   <ParameterList name="function-linear" type="ParameterList">
                    <Parameter name="x0" type="Array(double)" value="{-1, 0., 0.}" />
                    <Parameter name="y0" type="double" value="0.0" />
                    <Parameter name="gradient" type="Array(double)" value="{1.0,0.0,0.0}" />
                   </ParameterList>
                </ParameterList>
              </ParameterList>
            </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>

      <ParameterList name="surface-air_temperature" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">
          <ParameterList name="domain" type="ParameterList">
            <Parameter name="region" type="string" value="surface domain" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">

          <ParameterList name="function-bilinear-and-time" type="ParameterList">
              <Parameter name="file" type="string" value="../shared_files/watershed_daymet-ats-2010-01-01_2023-12-31.h5" />
              <Parameter name="row header" type="string" value="y [m]" />
              <Parameter name="column header" type="string" value="x [m]" />
              <Parameter name="row coordinate" type="string" value="y" />     
              <Parameter name="column coordinate" type="string" value="x" />  
              <Parameter name="time header" type="string" value="time [s]" />
              <Parameter name="value header" type="string" value="air temperature [K]" />
          </ParameterList>

        </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>

      <ParameterList name="surface-incoming_shortwave_radiation" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">
          <ParameterList name="domain" type="ParameterList">
            <Parameter name="region" type="string" value="surface domain" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">


        <ParameterList name="function-bilinear-and-time" type="ParameterList">
        <Parameter name="file" type="string" value="../shared_files/watershed_daymet-ats-2010-01-01_2023-12-31.h5"/>
        <Parameter name="row header" type="string" value="y [m]"/>
        <Parameter name="row coordinate" type="string" value="y"/>
        <Parameter name="column header" type="string" value="x [m]"/>
        <Parameter name="column coordinate" type="string" value="x"/>
        <Parameter name="time header" type="string" value="time [s]"/>
        <Parameter name="value header" type="string" value="incoming shortwave radiation [W m^-2]"/>
        </ParameterList>
     
            </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>

      <ParameterList name="surface-vapor_pressure_air" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <ParameterList name="function" type="ParameterList">
          <ParameterList name="domain" type="ParameterList">
            <Parameter name="region" type="string" value="surface domain" />
            <Parameter name="component" type="string" value="cell" />
            <ParameterList name="function" type="ParameterList">

              <ParameterList name="function-bilinear-and-time" type="ParameterList">
                <Parameter name="file" type="string" value="../shared_files/watershed_daymet-ats-2010-01-01_2023-12-31.h5" />
                <Parameter name="row header" type="string" value="y [m]" />     
                <Parameter name="column header" type="string" value="x [m]" />
                <Parameter name="row coordinate" type="string" value="y" />
                <Parameter name="column coordinate" type="string" value="x" />    
                <Parameter name="time header" type="string" value="time [s]" />
                <Parameter name="value header" type="string" value="vapor pressure air [Pa]" />
              </ParameterList>

            </ParameterList>
          </ParameterList>
        </ParameterList>
      </ParameterList>


     <ParameterList name="base_porosity" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <Parameter name="constant in time" type="bool" value="true" />

        <ParameterList name="function" type="ParameterList">
          <ParameterList name="bedrock" type="ParameterList">
            <Parameter name="region" type="string" value="bedrock"/>
            <Parameter name="component" type="string" value="cell"/>
            <ParameterList name="function" type="ParameterList">
              <ParameterList name="function-constant" type="ParameterList">
                <Parameter name="value" type="double" value="0.15"/>
              </ParameterList>
            </ParameterList>
          </ParameterList>

    <ParameterList name="NRCS1000" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1000" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
        </ParameterList>
      </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1001" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1001" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1002" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1002" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1003" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1003" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1004" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1004" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1005" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1005" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
        </ParameterList>
      </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1006" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1006" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS100" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS100" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="0.05" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS101" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS101" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="0.05" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS102" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS102" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="0.16" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS103" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS103" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@103_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS104" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS104" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@104_Poro@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>

        </ParameterList>
      </ParameterList>

      <ParameterList name="porosity" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="compressible porosity" />
        <ParameterList name="compressible porosity model parameters" type="ParameterList">
          <ParameterList name="computational domain" type="ParameterList">
            <Parameter name="region" type="string" value="computational domain" />
            <Parameter name="pore compressibility [Pa^-1]" type="double" value="1e-09" />
          </ParameterList>
        </ParameterList>
      </ParameterList>

     <ParameterList name="permeability" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable" />
        <Parameter name="constant in time" type="bool" value="true" />
        <ParameterList name="function" type="ParameterList">

            <ParameterList name="bedrock" type="ParameterList">
            <Parameter name="region" type="string" value="bedrock"/>
            <Parameter name="component" type="string" value="cell"/>
            <ParameterList name="function" type="ParameterList">
              <ParameterList name="function-constant" type="ParameterList">
                <Parameter name="value" type="double" value="1e-16"/>
              </ParameterList>
            </ParameterList>
          </ParameterList>
    <ParameterList name="NRCS1000" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1000" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1001" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1001" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1002" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1002" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1003" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1003" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1004" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1004" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1005" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1005" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="NRCS1006" type="ParameterList">
      <Parameter name="region" type="string" value="NRCS1006" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@Soil_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
     <ParameterList name="GLHYMPS100" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS100" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="1e-15" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS101" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS101" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="3e-15" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
       <ParameterList name="GLHYMPS102" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS102" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="2e-13" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
    <ParameterList name="GLHYMPS103" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS103" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@103_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>
        <ParameterList name="GLHYMPS104" type="ParameterList">
      <Parameter name="region" type="string" value="GLHYMPS104" />
      <Parameter name="component" type="string" value="cell" />
      <ParameterList name="function" type="ParameterList">
        <ParameterList name="function-constant" type="ParameterList">
          <Parameter name="value" type="double" value="@104_Perm@" />
    </ParameterList>
    </ParameterList>
    </ParameterList>

        </ParameterList>
      </ParameterList>


      <ParameterList name="surface-relative_permeability" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value=" 1" />
      </ParameterList>

      <ParameterList name="mass_density_liquid" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="1000" />
      </ParameterList>

      <ParameterList name="molar_density_liquid" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="55000" />
      </ParameterList>

      <ParameterList name="viscosity_liquid" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="0.00089" />
      </ParameterList>

      <ParameterList name="surface-molar_density_liquid" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="55000" />
      </ParameterList>

      <ParameterList name="surface-mass_density_liquid" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="1000" />
      </ParameterList>

      <ParameterList name="surface-source_molar_density" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="independent variable constant" />
        <Parameter name="value" type="double" value="55000" />
      </ParameterList>

      <ParameterList name="surface-overland_conductivity" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="overland conductivity" />
        <ParameterList name="overland conductivity model" type="ParameterList">
          <Parameter name="overland conductivity type " type="string" value="manning" />
          <Parameter name="Manning exponent" type="double" value="0.66666667" />
          <Parameter name="slope regularization epsilon" type="double" value="0.01" />
        </ParameterList>
      </ParameterList>

<!-- newly added -->
      <ParameterList name="canopy-drainage" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="canopy drainage" />
        <Parameter name="drainage key" type="string" value="canopy-drainage" />
        <Parameter name="fraction wet key" type="string" value="canopy-fracwet" />
        <Parameter name="area index key" type="string" value="canopy-leaf_area_index" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

      <ParameterList name="canopy-throughfall_drainage_rain" type="ParameterList">
        <Parameter name="evaluator type" type="string" value="interception fraction" />
        <Parameter name="area index key" type="string" value="canopy-leaf_area_index" />
        <Parameter name="units" type="string" value="m s^-1" />
      </ParameterList>

    </ParameterList>
    <!-- eo evaluators -->

    <ParameterList name="initial conditions" type="ParameterList">
      <ParameterList name="atmospheric_pressure" type="ParameterList">
        <Parameter name="value" type="double" value="101325.0" />
      </ParameterList>
      <ParameterList name="gravity" type="ParameterList">
        <Parameter name="value" type="Array(double)" value="{0.0,0.0,-9.81}" />
      </ParameterList>
           <ParameterList name="land cover types" type="ParameterList">

          <ParameterList name="None" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="10.0" />
          <Parameter name="rooting profile alpha [-]" type="double" value="6.0" />
          <Parameter name="rooting profile beta [-]" type="double" value="2.0" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="224000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="3500" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
          <Parameter name="air snow temperature difference [C]" type="double" value="2.0" />
          <Parameter name="leaf on time [doy]" type="double" value="101" />
          <Parameter name="leaf off time [doy]" type="double" value="254" />
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.4" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.1" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>

        <ParameterList name="Barren Land" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="1.0" />
          <Parameter name="rooting profile alpha [-]" type="double" value="1.0" />
          <Parameter name="rooting profile beta [-]" type="double" value="1.0" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="275000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="7400" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
          <Parameter name="air snow temperature difference [C]" type="double" value="2.0" />
          <Parameter name="leaf on time [doy]" type="double" value="101" />
          <Parameter name="leaf off time [doy]" type="double" value="254" />
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.53" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.11" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>

        <ParameterList name="Deciduous Forest" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="10.0" />
          <Parameter name="rooting profile alpha [-]" type="double" value="6.0" />
          <Parameter name="rooting profile beta [-]" type="double" value="2.0" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="224000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="3500" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
          <Parameter name="air snow temperature difference [C]" type="double" value="2.0" />
          <Parameter name="leaf on time [doy]" type="double" value="101" />
          <Parameter name="leaf off time [doy]" type="double" value="254" />
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.4" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.1" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>

        <ParameterList name="Evergreen Forest" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="7.0" />
          <Parameter name="rooting profile alpha [-]" type="double" value="7.0" />
          <Parameter name="rooting profile beta [-]" type="double" value="2.0" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="255000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="6600" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="@Melt_rate_conifer@" />
          <Parameter name="air snow temperature difference [C]" type="double" value="@Diff_Temp_conifer@" />
          <Parameter name="leaf on time [doy]" type="double" value="101" />
          <Parameter name="leaf off time [doy]" type="double" value="254" />
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.4" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.1" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>

        <ParameterList name="Shrub/Scrub" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="5.0" />
          <Parameter name="rooting profile alpha [-]" type="double" value="6.0" />
          <Parameter name="rooting profile beta [-]" type="double" value="2.0" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="428000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="8300" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
          <Parameter name="air snow temperature difference [C]" type="double" value="2.0" />
          <Parameter name="leaf on time [doy]" type="double" value="101" />
          <Parameter name="leaf off time [doy]" type="double" value="254" />
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.53" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.11" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>

        <ParameterList name="Grassland/Herbaceous" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="8.53" />
          <Parameter name="rooting profile alpha [-]" type="double" value="8.53" />
          <Parameter name="rooting profile beta [-]" type="double" value="8.53" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="275000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="7400" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
          <Parameter name="air snow temperature difference [C]" type="double" value="2.0" />
          <Parameter name="leaf on time [doy]" type="double" value="101" />
          <Parameter name="leaf off time [doy]" type="double" value="254" />
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.53" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.11" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>

        <ParameterList name="Woody Wetlands" type="ParameterList">
          <Parameter name="rooting depth max [m]" type="double" value="4.5" />
          <Parameter name="rooting profile alpha [-]" type="double" value="4.5" />
          <Parameter name="rooting profile beta [-]" type="double" value="4.5" />
          <Parameter name="mafic potential at fully closed stomata [Pa]" type="double" value="224000" />
          <Parameter name="mafic potential at fully open stomata [Pa]" type="double" value="35000" />
          <Parameter name="snow melt rate [mm day^-1 C^-1]" type="double" value="2.74" />
          <Parameter name="air snow temperature difference [C]" type="double" value="2.0" />
          <Parameter name="leaf on time [doy]" type="double" value="192" />
          <Parameter name="leaf off time [doy]" type="double" value="345" /> 
          <Parameter name="Priestley-Taylor alpha of snow [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of bare ground [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of canopy [-]" type="double" value="1.26" />
          <Parameter name="Priestley-Taylor alpha of transpiration [-]" type="double" value="0.32" />
          <Parameter name="albedo of bare ground [-]" type="double" value="0.39" />
          <Parameter name="emissivity of bare ground [-]" type="double" value="0.98" />
          <Parameter name="albedo of canopy [-]" type="double" value="0.1" />
          <Parameter name="emissivity of canopy [-]" type="double" value="0.95" />
          <Parameter name="Beer's law extinction coefficient, shortwave [-]" type="double" value="0.6" />
          <Parameter name="Beer's law extinction coefficient, longwave [-]" type="double" value="5" />
          <Parameter name="snow transition depth [m]" type="double" value="0.02" />
          <Parameter name="dessicated zone thickness [m]" type="double" value="0.1" />
          <Parameter name="Clapp and Hornberger b [-]" type="double" value="1" />
        </ParameterList>
      </ParameterList>

   </ParameterList>
  </ParameterList>
  <!-- eo state -->

  <ParameterList name="visualization">

    <ParameterList name="domain" type="ParameterList">
      <Parameter name="times start period stop" type="Array(double)" value="{0,1,-1}" />
      <Parameter name="times start period stop units" type="string" value="d" />
      <Parameter name="time units" type="string" value="d" />
    </ParameterList>
    <ParameterList name="surface" type="ParameterList">
      <Parameter name="times start period stop" type="Array(double)" value="{0,1,-1}" />
      <Parameter name="times start period stop units" type="string" value="d" />
      <Parameter name="time units" type="string" value="d" />
      <Parameter name="aliased domains" type="Array(string)" value="{snow,canopy}" />
    </ParameterList>
  </ParameterList>

  <ParameterList name="observations" type="ParameterList">
    <ParameterList name="fluxes" type="ParameterList">
      <Parameter name="observation output filename" type="string" value="water_balance.dat" />
      <Parameter name="write interval" type="int" value="10" />
      <Parameter name="time units" type="string" value="d" />
      <Parameter name="times start period stop" type="Array(double)" value="{ 0, 1,-1}" />
      <Parameter name="times start period stop units" type="string" value="d" />
      <ParameterList name="observed quantities" type="ParameterList">
        <!-- water content [mol] -->
        <ParameterList name="surface water content [mol]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-water_content" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="cell" />
        </ParameterList>
        <ParameterList name="subsurface water content [mol]" type="ParameterList">
          <Parameter name="variable" type="string" value="water_content" />
          <Parameter name="region" type="string" value="computational domain" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="cell" />
        </ParameterList>
        <ParameterList name="snow water content [mol]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-water_content" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="cell" />
        </ParameterList>
        <ParameterList name="canopy water content [mol]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-water_content" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="cell" />
        </ParameterList>

        <!-- global fluxes -->
        <ParameterList name="runoff generation [mol d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-water_flux" />
          <Parameter name="direction normalized flux" type="bool" value="true" />
          <Parameter name="region" type="string" value="surface boundary" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="face" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="evapotranspiration [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-total_evapotranspiration" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="snow precipitation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-precipitation" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="rain precipitation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-precipitation_rain" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>

        <!-- canopy fluxes -->
        <ParameterList name="canopy evaporation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-evaporation" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="canopy drainage [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-drainage" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="canopy interception [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-interception" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        
        <!-- snow fluxes -->
        <ParameterList name="snow evaporation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-evaporation" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="snowmelt [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-melt" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="snow throughfall + canopy drainage [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-throughfall_drainage_snow" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>

        <!-- surface fluxes -->
        <ParameterList name="surface evaporation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-evaporation" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="water throughfall + canopy drainage [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-throughfall_drainage_rain" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>

        <!-- subsurface fluxes -->
        <ParameterList name="transpiration [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-transpiration" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="exfiltration [mol d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-surface_subsurface_flux" />
          <Parameter name="region" type="string" value="surface domain" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
      </ParameterList>
    </ParameterList>


    <ParameterList name="surface outlet flux" type="ParameterList">
      <Parameter name="variable" type="string" value="surface-water_flux" />
      <Parameter name="direction normalized flux" type="bool" value="true" />
      <Parameter name="region" type="string" value="surface boundary" />
      <Parameter name="functional" type="string" value="extensive integral" />
      <Parameter name="delimiter" type="string" value=" " />
      <Parameter name="location name" type="string" value="face" />
      <Parameter name="write interval" type="int" value="30" />
      <Parameter name="observation output filename" type="string" value="surface_outlet_flux.dat" />
      <Parameter name="times start period stop" type="Array(double)" value="{0.0,1,-1.0}" />
      <Parameter name="times start period stop units" type="string" value="d" />
    </ParameterList>
    
    
    <ParameterList name="SUF1 outlet flux" type="ParameterList">
      <Parameter name="variable" type="string" value="surface-water_flux" />
      <Parameter name="direction normalized flux" type="bool" value="true" />
      <Parameter name="direction normalized flux relative to region" type="string" value="SUF1" />
      <Parameter name="region" type="string" value="SUF1 boundary" />
      <Parameter name="functional" type="string" value="extensive integral" />
      <Parameter name="delimiter" type="string" value=" " />
      <Parameter name="location name" type="string" value="face" />
      <Parameter name="write interval" type="int" value="30" />
      <Parameter name="observation output filename" type="string" value="SUF1_outlet_flux.dat" />
      <Parameter name="times start period stop" type="Array(double)" value="{0.0,1,-1.0}" />
      <Parameter name="times start period stop units" type="string" value="d" />
    </ParameterList>
      
     <ParameterList name="SUF1 fluxes" type="ParameterList">
      <Parameter name="observation output filename" type="string" value="SUF1_water_balance.dat" />
      <Parameter name="write interval" type="int" value="10" />
      <Parameter name="time units" type="string" value="d" />
      <Parameter name="times start period stop" type="Array(double)" value="{ 0, 1,-1}" />
      <Parameter name="times start period stop units" type="string" value="d" />
      <ParameterList name="observed quantities" type="ParameterList">
        <!-- global fluxes -->
        <ParameterList name="runoff generation [mol d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-water_flux" />
          <Parameter name="direction normalized flux" type="bool" value="true" />
          <Parameter name="region" type="string" value="SUF1 boundary" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="face" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="evapotranspiration [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-total_evapotranspiration" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="snow precipitation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-precipitation" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="rain precipitation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-precipitation_rain" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>

        <!-- canopy fluxes -->
        <ParameterList name="canopy evaporation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-evaporation" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="canopy drainage [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-drainage" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="canopy interception [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-interception" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        
        <!-- snow fluxes -->
        <ParameterList name="snow evaporation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-evaporation" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="snowmelt [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="snow-melt" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="snow throughfall + canopy drainage [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-throughfall_drainage_snow" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>

        <!-- surface fluxes -->
        <ParameterList name="surface evaporation [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-evaporation" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="water throughfall + canopy drainage [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="canopy-throughfall_drainage_rain" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>

        <!-- subsurface fluxes -->
        <ParameterList name="transpiration [m d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-transpiration" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="average" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
        <ParameterList name="exfiltration [mol d^-1]" type="ParameterList">
          <Parameter name="variable" type="string" value="surface-surface_subsurface_flux" />
          <Parameter name="region" type="string" value="SUF1" />
          <Parameter name="functional" type="string" value="extensive integral" />
          <Parameter name="location name" type="string" value="cell" />
          <Parameter name="time integrated" type="bool" value="true" />
        </ParameterList>
      </ParameterList>
    </ParameterList>

  </ParameterList>

</ParameterList>
