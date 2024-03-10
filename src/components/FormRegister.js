
import Input from "./input";

export default function FormRegister({ realEstateToCreate }) {
    const handleChange = (e) => {
        const { name, value } = e.target;
        setRealEstateToCreate({ ...realEstateToCreate, [name]: value });
    }
    return (

        <div className="mt-6">
            <h4 className="font-bold text-base">Real Estate register</h4>
            <form className="mt-6">
                <div class="grid gap-6 mb-6 md:grid-cols-2">
                    <div className="form-group">
                        <Input type="text" name="name" placeholder="Enter the name" value={realEstateToCreate.name} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="text" name="description" placeholder="Enter the description" value={realEstateToCreate.description} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="text" name="image" placeholder="Enter the image" value={realEstateToCreate.image} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="text" name="location" placeholder="Enter the location" value={realEstateToCreate.location} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="number" name="price" placeholder="Enter the price" value={realEstateToCreate.price} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="text" name="address" placeholder="Enter the address" value={realEstateToCreate.address} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="date" name="createdAt" placeholder="Enter the createdAt" value={realEstateToCreate.createdAt} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="text" name="area" placeholder="Enter the area" value={realEstateToCreate.area} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="number" name="rooms" placeholder="Enter the rooms" value={realEstateToCreate.rooms} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="number" name="bathrooms" placeholder="Enter the bathrooms" value={realEstateToCreate.bathrooms} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="number" name="garage" placeholder="Enter the garage" value={realEstateToCreate.garage} onChange={handleChange} />
                    </div>
                    <div className="form-group">
                        <Input type="text" name="isSold" placeholder="Enter the isSold" value={realEstateToCreate.isSold} onChange={handleChange} />
                    </div>
                </div>
                <br />
                <br />
            </form>
        </div>
    )
}