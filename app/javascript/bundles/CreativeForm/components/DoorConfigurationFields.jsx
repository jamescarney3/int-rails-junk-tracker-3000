import React, { useState } from 'react';


const baseConfigs = {
  driver_front: { sliding: false },
  passenger_front: { sliding: false },
  driver_rear: { sliding: false },
  passenger_rear: { sliding: false },
};

const DoorConfigurationFields = ({ doorConfiguration }) => {
  const configs = doorConfiguration || baseConfigs;

  // rails json field serialization problems here
  const [driverFrontSliding, setDriverFrontSliding] = useState(configs.driver_front.sliding === 'true' || false);
  const [passengerFrontSliding, setPassengerFrontSliding] = useState(configs.passenger_front.sliding === 'true' || false);
  const [driverRearSliding, setDriverRearSliding] = useState(configs.driver_rear.sliding === 'true' || false);
  const [passengerRearSliding, setPassengerRearSliding] = useState(configs.passenger_rear.sliding === 'true' || false);

  return (
    <>
      <div className="field">
        <input
          type="hidden"
          name="vehicle[door_configuration][driver_front][sliding]"
          value={false}
        />
        <input
          type="checkbox"
          value={true}
          name="vehicle[door_configuration][driver_front][sliding]"
          checked={driverFrontSliding}
          onChange={() => setDriverFrontSliding(!driverFrontSliding)}
        />
        <label style={{ display: 'inline' }}>Driver Front Door Sliding</label>
      </div>
      <div className="field">
        <input
          type="hidden"
          name="vehicle[door_configuration][passenger_front][sliding]"
          value={false}
        />
        <input
          type="checkbox"
          value={true}
          name="vehicle[door_configuration][passenger_front][sliding]"
          checked={passengerFrontSliding}
          onChange={() => setPassengerFrontSliding(!passengerFrontSliding)}
        />
        <label style={{ display: 'inline' }}>Passenger Front Door Sliding</label>
      </div>
      <div className="field">
        <input
          type="hidden"
          name="vehicle[door_configuration][driver_rear][sliding]"
          value={false}
        />
        <input
          type="checkbox"
          value={true}
          name="vehicle[door_configuration][driver_rear][sliding]"
          checked={driverRearSliding}
          onChange={() => setDriverRearSliding(!driverRearSliding)}
        />
        <label style={{ display: 'inline' }}>Driver Rear Door Sliding</label>
      </div>
      <div className="field">
        <input
          type="hidden"
          name="vehicle[door_configuration][passenger_rear][sliding]"
          value={false}
        />
        <input
          type="checkbox"
          value={true}
          name="vehicle[door_configuration][passenger_rear][sliding]"
          checked={passengerRearSliding}
          onChange={() => setPassengerRearSliding(!passengerRearSliding)}
        />
        <label style={{ display: 'inline' }}>Passenger Rear Door Sliding</label>
      </div>
    </>
  );
};

export default DoorConfigurationFields;
