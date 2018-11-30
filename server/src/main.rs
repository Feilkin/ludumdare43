extern crate enet;
#[macro_use]
extern crate log;
extern crate env_logger;
#[macro_use]
extern crate serde_derive;
extern crate rmp;
extern crate rmp_serde;
extern crate serde;

use std::collections::HashMap;
use std::net::Ipv4Addr;

use enet::*;
use rmp_serde::{Deserializer, Serializer};
use serde::{Deserialize, Serialize};

#[derive(Serialize, PartialEq, Deserialize, Debug)]
#[serde(tag = "type")]
enum Message {
    PlayerJoin {
        name: String,
    },
    PlayerDelta {
        player_id: u32,
        position: Option<(u32, u32)>,
        name: Option<String>,
    },
    PlayerLeave {
        player_id: u32,
    },
}

#[derive(Serialize, PartialEq, Deserialize, Debug)]
#[serde(tag = "type")]
enum Response {
    PlayerJoin { player_id: u32 },
}

struct Player {
    id: u32,
    name: String,
    position: (u32, u32),
}

fn main() {
    env_logger::init();

    let enet = Enet::new().expect("could not initialize Enet");
    let local_addr = Address::new(Ipv4Addr::LOCALHOST, 9001);

    let mut host = enet
        .create_host::<()>(
            Some(&local_addr),
            10,
            ChannelLimit::Maximum,
            BandwidthLimit::Limited(256),
            BandwidthLimit::Limited(256),
        ).expect("could not create host");

    info!("listening on LOCALHOST:9001");

    loop {
        match host.service(1000).expect("service failed") {
            Some(Event::Connect(_)) => {
                info!("peer connected");
            }
            Some(Event::Disconnect(..)) => {
                info!("peer disconnected");
            }
            Some(Event::Receive {
                ref mut sender,
                channel_id,
                ref packet,
            }) => {
                let mut de = Deserializer::new(packet.data());
                let message: Result<Message, _> =
                    Deserialize::deserialize(&mut de).and_then(|message| {
                        debug!("received packet: {:?}", message);
                        Ok(message)
                    });
                if let Ok(message) = message {
                    match message {
                        Message::PlayerJoin { name } => {
                            info!("Player {} requested to join.", name);

                            let mut buf = Vec::new();
                            let response = Response::PlayerJoin { player_id: 1 };
                            response
                                .serialize(&mut Serializer::new_named(&mut buf))
                                .unwrap();

                            sender
                                .send_packet(
                                    Packet::new(&buf, PacketMode::ReliableSequenced).unwrap(),
                                    0,
                                ).unwrap();
                        }
                        _ => (),
                    }
                }
            }
            _ => (),
        }
    }
}
