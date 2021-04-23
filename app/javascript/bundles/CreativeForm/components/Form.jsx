import React, { useState } from 'react';

const CreativeForm = (props) => {
  const {
    vehicle,
  } = props;

  const [nickname, setNickname] = useState(vehicle.nickname || '');
  const [mileage, setMileage] = useState(vehicle.mileage || '');
  const [wheels, setWheels] = useState(vehicle.wheels || '');
  const [vehicleType, setVehicleType] = useState(vehicle.vehicle_type || 'sedan');
  const [engineStatus, setEngineStatus] = useState(vehicle.engine_status || '');

  return (
    <div>
      <div className="field">
        <label>Type</label>
        <select
          name="vehicle[vehicle_type]"
          id="vehicleType"
          onChange={(e) => setVehicleType(e.target.value)}
          value={vehicleType}
        >
          <option value="sedan">Sedan</option>
          <option value="coupe">Coupe</option>
          <option value="minivan">Minivan</option>
          <option value="motorcycle">Motorcycle</option>
        </select>
      </div>
      <div className="field">
        <label>Nickname</label>
        <input
          id="nickname"
          type="text"
          value={nickname}
          name='vehicle[nickname]'
          onChange={(e) => setNickname(e.target.value)}
        />
      </div>
      <div className="field">
        <label>Mileage</label>
        <input
          id="mileage"
          type="text"
          value={mileage}
          name='vehicle[mileage]'
          onChange={(e) => setMileage(e.target.value)}
        />
      </div>
      <div className="field">
        <label>Wheels</label>
        <select
          name="vehicle[wheels]"
          id="wheels"
          onChange={(e) => setWheels(e.target.value)}
          value={wheels}
        >
          <option value="" disabled>select</option>
          <option value={0}>0</option>
          <option value={1}>1</option>
          <option value={2}>2</option>
          <option value={3}>3</option>
          <option value={4}>4</option>
        </select>
      </div>
      <div className="field">
        <label>Engine Status</label>
        <select
          name="vehicle[engine_status]"
          id="engineStatus"
          onChange={(e) => setEngineStatus(e.target.value)}
          value={engineStatus}
        >
          <option value="" disabled>select</option>
          <option value="works">works</option>
          <option value="fixable">fixable</option>
          <option value="junk">junk</option>
        </select>
      </div>
    </div>
  );
};

export default CreativeForm;
