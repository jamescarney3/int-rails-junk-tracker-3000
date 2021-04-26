import React, { useState } from 'react';
import DoorConfigurationFields from './DoorConfigurationFields';

const CreativeForm = (props) => {
  const {
    vehicle,
  } = props;

  console.log(vehicle)

  const [nickname, setNickname] = useState(vehicle.nickname || '');
  const [mileage, setMileage] = useState(vehicle.mileage || '');
  const [wheels, setWheels] = useState(vehicle.wheels || '');
  const [vehicleType, setVehicleType] = useState(vehicle.vehicle_type || 'sedan');
  const [engineStatus, setEngineStatus] = useState(vehicle.engine_status || '');
  const [doors, setDoors] = useState(vehicle.doors || '');
  const [seat, setSeat] = useState(vehicle.seat_status || '');

  const renderDoorsOptions = () => {
    switch (vehicleType) {
      case 'sedan':
      case 'minivan':
      return (
        <>
          <option value="" disabled>select</option>
          <option value={0}>0</option>
          <option value={1}>1</option>
          <option value={2}>2</option>
          <option value={3}>3</option>
          <option value={4}>4</option>
        </>
      );
      case 'coupe':
        return (
          <>
            <option value="" disabled>select</option>
            <option value={0}>0</option>
            <option value={1}>1</option>
            <option value={2}>2</option>
          </>
        );
      default:
        return null;
    }
  };

  const renderDoorsInput = () => {
    if (vehicleType === 'motorcycle') return null;
    return (
      <div className="field">
        <label>Doors</label>
        <select
          name="vehicle[doors]"
          id="doors"
          onChange={(e) => setDoors(e.target.value)}
          value={doors}
        >
          {renderDoorsOptions()}
        </select>
      </div>
    );
  };

  const renderSeatInput = () => {
  if (vehicleType !== 'motorcycle') return null;
    return (
      <div className="field">
        <label>Seat</label>
        <select
          name="vehicle[seat_status]"
          id="seat"
          onChange={(e) => setSeat(e.target.value)}
          value={seat}
        >
          <option value="" disabled>select</option>
          <option value="works">works</option>
          <option value="fixable">fixable</option>
          <option value="junk">junk</option>
        </select>
      </div>
    );
  };

  const renderDoorsConfigField = () => {
    if (vehicleType !== 'minivan') return null;
    return (<DoorConfigurationFields doorConfiguration={vehicle.door_configuration} />);
  };

  return (
    <div>
      <div className="field">
        <label>Type</label>
        <select
          disabled={vehicle.vehicle_type}
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
      {renderDoorsInput()}
      {renderSeatInput()}
      {renderDoorsConfigField()}
    </div>
  );
};

export default CreativeForm;
