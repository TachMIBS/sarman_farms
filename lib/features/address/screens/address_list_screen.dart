import 'package:sarman_farms/common/widgets/loader.dart';
import 'package:sarman_farms/constants/global_variables.dart';
import 'package:sarman_farms/features/address/screens/new_address_screen.dart';
import 'package:sarman_farms/features/address/services/address_services.dart';
import 'package:sarman_farms/models/address.dart';
import 'package:flutter/material.dart';

class AllAddressScreen extends StatefulWidget {
  static const String routeName = '/all-address';

  const AllAddressScreen({Key? key}) : super(key: key);

  @override
  State<AllAddressScreen> createState() => _AllAddressScreenState();
}

class _AllAddressScreenState extends State<AllAddressScreen> {
  final AddressServices addressServices = AddressServices();
  List<Address>? addresses;
  @override
  void initState() {
    super.initState();
    fetchAddress();
  }

  void fetchAddress() async {
    addresses = await addressServices.fetchAllAddress(context: context);
    setState(() {});
  }

  void deleteProduct(Address address, int index) {
    addressServices.deleteAddress(
        context: context,
        address: address,
        onSuccess: () {
          addresses!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          title: const Text('Address'),
        ),
      ),
      body: addresses == null
          ? const Loader()
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Addresses',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AddAddressScreen.routeName);
                      },
                      title: const Text("Add New Address"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    const ListTile(
                      title: Text("Add a new pickup location"),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 20,
                      ),
                    ),
                    const Divider(),
                    const Text(
                      'Personal Addresses',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addresses!.length,
                      itemBuilder: (context, index) {
                        var address = addresses![index];
                        return addressListCell(address, index);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Container addressListCell(Address address, int index) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text('${address.flatNo} ${address.area}'),
              Text(address.city),
              const Text('India'),
              Text('Phone number: ${address.mobile}'),
              const Text(
                'Add delivery instructions',
                style: TextStyle(
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                label: const Text(
                  'Update delivery location',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: GlobalVariables.secondaryColor,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Warning!'),
                              content: const Text(
                                'Are you sure want to delete this address?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () =>
                                        deleteProduct(address, index),
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    )),
                              ],
                            );
                          });
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
