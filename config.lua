Config = {}

-- Lokasi tempat player pilih rute (1 tempat saja)
Config.SelectionPoint = vector3(436.5467, -646.0215, 28.7423)

-- Lokasi spawn bus per rute (beda-beda)
Config.SpawnPoints = {
    city = vector3(404.3800, -638.1497, 28.5001),
    sandy = vector3(405.8037, -644.2249, 28.5002),
    paleto = vector3(406.4477, -650.1693, 28.5003),
}


Config.BusModel = 'bus'


Config.Rewards = {
    city = { money = 30000, item = { name = 'bus_ticket', count = 1 } },
    sandy = { money = 45000, item = { name = 'bus_ticket', count = 2 } },
    paleto = { money = 55000, item = { name = 'bus_ticket', count = 3 } }
}

Config.Routes = {
    city = {
        label = "Rute Kota",
        stops = {
            vector3(-546.2734, -1088.5977, 22.1926),
            vector3(-1043.7437, -2723.8513, 20.1014),
            vector3(-198.3759, -1877.6311, 27.9098),
            vector3(-515.4321, -287.7522, 35.2886),
            vector3(-243.6284, -714.3281, 33.4480),
            vector3(-1269.1379, -561.0624, 29.7341),
            
        },
        returnPoint = vector3(421.2581, -645.4828, 28.5002)
    },
    sandy = {
        label = "Rute Sandy Shores",
        stops = {
            vector3(1200.0, 3600.0, 33.0), vector3(1300.0, 3600.0, 33.0),
            vector3(1400.0, 3600.0, 33.0), vector3(1500.0, 3600.0, 33.0),
            vector3(1600.0, 3600.0, 33.0), vector3(1700.0, 3600.0, 33.0),
        },
        returnPoint = vector3(455.0, -600.0, 28.5)
    },
    paleto = {
        label = "Rute Paleto Bay",
        stops = {
            vector3(-100.0, 6200.0, 31.5), vector3(-200.0, 6300.0, 31.5),
            vector3(-300.0, 6400.0, 31.5), vector3(-400.0, 6500.0, 31.5),
            vector3(-500.0, 6600.0, 31.5), vector3(-600.0, 6700.0, 31.5),
            vector3(-700.0, 6800.0, 31.5), vector3(-800.0, 6900.0, 31.5),
        },
        returnPoint = vector3(455.0, -600.0, 28.5)
    }
}