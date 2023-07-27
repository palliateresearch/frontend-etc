//
//  childDiscoverScroll.swift
//  PowerPlay
//
//  Created by Nishka Sharma on 7/20/23.
//

import SwiftUI

struct childDiscoverScroll: View {
    
    @State private var selectedTab: Int = 0
    @State private var color: String?
    @State var childModel = CurrentLesson()
    @State var chapterLabel: String? = "C1"
    @ObservedObject var childData: ChildViewData
    
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                childDiscoverActive(
                    progress: $childModel.progressC1,
                    childModel: $childModel,
                    childData: childData,
                    chapterLabel: "C1",
                    image: "sparkyWithClouds",
                    chapter: "The Power of Electricity",
                    lesson: ["Lesson 1: What is it about?", "Lesson 2: What is it about?", "Lesson 3: What is it about?"],
                    header: [
                      // Page 1 - What is Energy?
                        [
                            "Generating Electricity with Hand Cranks",
                            "The Potato Battery Experiment",
                            "Unveiling the World of Fossil Fuels",
                            "Discovering Nuclear Power",
                            "The Promise of Biomass Energy"
                          ],
                          // Page 2 - Harnessing Earth's Heat
                          [
                            "Geothermal Energy Unearthed",
                            "Beyond Dams: Hydropower Innovations",
                            "Riding the Waves: Wave Energy",
                            "Tapping Tidal Energy",
                            "Embracing a Greener Future: Renewable Energy"
                          ],
                          // Page 3 - Other Energy Sources
                          [
                            "Understanding Wind Power",
                            "Solar Energy: The Power of the Sun",
                            "Exploring Hydrogen as Fuel",
                            "The Marvel of Magnetic Energy",
                            "Nurturing Nature: Bioenergy Solutions"
                          ]
                    ],
                    content: [
                      // Page 1 - What is Energy?
                      [
                        "Geothermal Energy Unearthed: Explore the Earth's heat as a source of clean energy. Learn how geothermal power plants extract heat from the ground to produce electricity and heat buildings.",
                        "Beyond Dams: Hydropower Innovations: Dive into innovative hydropower technologies that generate electricity without building large dams. Discover how run-of-the-river and tidal stream systems work.",
                        "Riding the Waves: Wave Energy: Ride the waves of the ocean and harness its power. Understand how wave energy converters capture energy from the motion of waves and convert it into electricity.",
                        "Tapping Tidal Energy: Explore the predictable power of tides. Learn how tidal energy is harnessed using various technologies like tidal barrages and tidal turbines.",
                        "Embracing a Greener Future: Renewable Energy: Embrace a sustainable future with renewable energy sources. Discover the benefits of solar, wind, geothermal, and other clean energy options."
                      ],

                      // Page 2 - Exploring Electricity
                      [
                        "Generating Electricity with Hand Cranks: Experience energy generation firsthand. Learn how hand cranks can produce electricity and power small devices.",
                        "The Potato Battery Experiment: Uncover the science behind potato batteries. Explore how chemical reactions between electrodes and potatoes generate a small amount of electricity.",
                        "Unveiling the World of Fossil Fuels: Dive into the world of fossil fuels. Understand the formation of coal, oil, and natural gas, and the impact of using these non-renewable resources.",
                        "Discovering Nuclear Power: Unravel the power of nuclear energy. Learn about nuclear fission, nuclear power plants, and the pros and cons of nuclear energy.",
                        "The Promise of Biomass Energy: Harness the energy potential of biomass. Explore how organic materials like wood and agricultural residues can be converted into bioenergy."
                      ],

                      // Page 3 - The Power of the Sun
                      [
                          "Understanding Wind Power: Discover the mechanics behind wind turbines and how wind energy is converted into electricity. Explore how wind farms are being utilized to produce renewable energy on a large scale.",
                          "Solar Energy: The Power of the Sun: Unveil the secrets of harnessing solar energy. Learn about photovoltaic cells and solar thermal technologies that convert sunlight into electricity or heat.",
                          "Exploring Hydrogen as Fuel: Delve into the potential of hydrogen as a clean fuel source. Understand how fuel cells and hydrogen combustion can power vehicles and generate electricity.",
                          "The Marvel of Magnetic Energy: Unlock the possibilities of magnetic energy. Learn about magnetic generators and their potential in providing a sustainable and constant source of power.",
                          "Nurturing Nature: Bioenergy Solutions: Explore the world of bioenergy and its role in a sustainable future. Discover how biofuels and biomass can replace fossil fuels in various applications."
                        ]
                    ],

                    frameSize: [375,375,375,375,375],
                    lessonNumber: ["Lesson 1", "Lesson 2", "Lesson 3"],
                    lessonName: ["What is it about?", "What is it used for", "Why is it important"]
                ).tag(0)
                
                if (childModel.Ch1Done == true){
                    childDiscoverActive(
                        progress: $childModel.progressC2,
                        childModel: $childModel,
                        childData: childData,
                        chapterLabel: "C2",
                        image: "sparkyWithClouds",
                        chapter: "Generating Energy",
                        lesson: [
                            "Lesson 1: Understanding Energy Sources",
                            "Lesson 2: Hands-On Energy Experiments",
                            "Lesson 3: Exploring Renewable Energy"
                        ],
                        header: [
                            ["What is Energy?", "Exploring Electricity", "The Power of the Sun", "Wind Energy in Action", "Harnessing the Power of Water"],
                            ["Generating Electricity with Hand Cranks", "The Potato Battery Experiment", "Unveiling the World of Fossil Fuels", "Discovering Nuclear Power", "The Promise of Biomass Energy"],
                            ["Geothermal Energy Unearthed", "Beyond Dams: Hydropower Innovations", "Riding the Waves: Wave Energy", "Tapping Tidal Energy", "Embracing a Greener Future: Renewable Energy"]
                        ],
                        content: [
                            // Page 1 - What is Energy?
                            [
                                "Energy is the magic that makes things work! It powers our world and everything around us. There are different types of energy - light, heat, motion, and more. Get ready to explore the fascinating world of energy and discover how it's transformed into electricity to light up our lives."
                            ],
                            // Page 2 - Exploring Electricity
                            [
                                "Electricity is like invisible lightning that flows through wires and brings our gadgets to life. We'll learn how electricity works, how it's generated, and the many ways we use it in our daily lives. It's time to dive into the electrifying world of electrons and circuits!"
                            ],
                            // Page 3 - The Power of the Sun
                            [
                                "The sun is not only the brightest star in the sky but also a powerful energy source! We'll explore how solar panels capture the sun's rays and turn them into clean electricity. Let's uncover the sun's secret to powering our homes and gadgets with its never-ending energy."
                            ],
                            // Page 4 - Wind Energy in Action
                            [
                                "Ever wondered how the wind can generate electricity? Wind energy is all about using the wind's force to spin massive wind turbines. We'll discover the science behind wind power and how it's a renewable energy source that's gentle on the planet."
                            ],
                            // Page 5 - Harnessing the Power of Water
                            [
                                "Water is not just for drinking - it's an energy powerhouse too! We'll learn about hydroelectric power and how dams and turbines turn the flow of water into electricity. Get ready to dive into the world of water-powered energy!"
                            ],
                            // Page 6 - Generating Electricity with Hand Cranks
                            [
                                "It's time to get active! In this lesson, we'll explore hand crank generators and see how our own physical energy can be turned into electricity. Let's grab those cranks and start generating power!"
                            ],
                            // Page 7 - The Potato Battery Experiment
                            [
                                "Get ready for a shocking experiment! We'll create a potato battery and learn how certain materials can produce a tiny electric current. Prepare to be amazed by the potato's power!"
                            ],
                            // Page 8 - Unveiling the World of Fossil Fuels
                            [
                                "Fossil fuels have been a major energy source for a long time. We'll delve into the world of coal, oil, and natural gas and understand how they're burned to generate electricity. But let's also explore their impact on the environment and why we need cleaner alternatives."
                            ],
                            // Page 9 - Discovering Nuclear Power
                            [
                                "Nuclear power might sound mysterious, but we'll uncover its secrets in this lesson. We'll explore how nuclear reactions can generate massive amounts of energy, but also talk about the safety concerns and why it's essential to handle nuclear power with care."
                            ],
                            // Page 10 - The Promise of Biomass Energy
                            [
                                "Let's talk about a greener way to produce energy! In this lesson, we'll learn about biomass energy, which comes from organic materials like plants and waste. It's a renewable energy source with great potential to power a sustainable future."
                            ],
                            // Page 11 - Geothermal Energy Unearthed
                            [
                                "Welcome to the world of geothermal energy! We'll discover how heat from beneath the Earth's surface can be harnessed to generate electricity and provide heating and cooling for buildings. Get ready to tap into the Earth's natural heat!"
                            ],
                            // Page 12 - Beyond Dams: Hydropower Innovations
                            [
                                "Hydropower is not just about big dams! In this lesson, we'll learn about various forms of hydropower, from large dams to smaller run-of-the-river systems. Let's explore innovative ways to harness the power of flowing water."
                            ],
                            // Page 13 - Riding the Waves: Wave Energy
                            [
                                "Get ready to ride the waves! We'll explore how wave energy technology works and how we can use the power of ocean waves to generate electricity in an eco-friendly way. It's time to catch some wave energy!"
                            ],
                            // Page 14 - Tapping Tidal Energy
                            [
                                "Did you know that tides can also generate electricity? We'll learn about tidal energy and how it's being used in some places to produce power. Let's explore the rising and falling tides and the energy they hold."
                            ],
                            // Page 15 - Embracing a Greener Future: Renewable Energy
                            [
                                "In our final lesson, we'll discuss the importance of renewable energy sources like solar, wind, and hydro. We'll explore the benefits of clean energy and why it's essential for our planet's future. It's time to embrace a greener and more sustainable future!"
                            ]
                        ],
                        frameSize: [400,400,400,400,400],
                        lessonNumber: ["Lesson 1", "Lesson 2", "Lesson 3"],
                        lessonName: ["What is it about?", "What is it used for", "Why is it important"]
                    ).tag(0)
                } else {
                    childDiscoverUnactive().tag(1)
                }
                
                
                if (childModel.Ch2Done == true) {
                    childDiscoverActive(
                        progress: $childModel.progressC3,
                        childModel: $childModel,
                        childData: childData,
                        chapterLabel: "C3",
                        image: "sparkyWithClouds",
                        chapter: "Going Green",
                        lesson: [
                            "Lesson 1: Teaching the Three R's",
                            "Lesson 2: Conserving Resources",
                            "Lesson 3: Caring for Nature"
                        ],
                        header: [
                            ["Reduce, Reuse, Recycle", "Conserving Water", "Energy Conservation", "Gardening and Composting", "Nature Exploration"],
                            ["Reduce Plastic Use", "Sustainable Transportation", "Volunteer and Community Involvement", "Renewable Energy Sources", "Environmental Awareness"],
                            ["Eco-Friendly Technologies", "Protecting Habitats", "Pollution Control", "Biodiversity Conservation", "Responsible Consumerism"]
                        ],
                        content: [
                            // Page 1 - Reduce, Reuse, Recycle
                            [
                                "Teach kids about the importance of the three R's: Reduce, Reuse, and Recycle. Explain how reducing waste, reusing items, and recycling materials can help protect the environment. Encourage them to participate in recycling activities at home or school."
                            ],
                            // Page 2 - Conserving Water
                            [
                                "Explain the significance of water conservation and how they can contribute. Teach them to turn off the tap while brushing their teeth, take shorter showers, and use water-efficient practices. Involve them in collecting rainwater for plants or in creating awareness about water conservation."
                            ],
                            // Page 3 - Energy Conservation
                            [
                                "Help kids understand the importance of conserving energy. Teach them to turn off lights, unplug electronics when not in use, and use natural light whenever possible. Involve them in energy-saving activities like hanging laundry to dry or switching to energy-efficient light bulbs."
                            ],
                            // Page 4 - Gardening and Composting
                            [
                                "Encourage children to grow their own plants and vegetables. Teach them about organic gardening practices and the benefits of composting kitchen scraps for nutrient-rich soil."
                            ],
                            // Page 5 - Nature Exploration
                            [
                                "Take kids on nature walks, visit parks, or engage in outdoor activities. Encourage them to appreciate the beauty of nature, observe wildlife, and learn about ecosystems."
                            ],
                            // Page 6 - Reduce Plastic Use
                            [
                                "Discuss the harmful effects of plastic pollution on the environment and marine life. Teach kids to reduce their plastic consumption by using reusable water bottles, cloth bags, and avoiding single-use plastic items."
                            ],
                            // Page 7 - Sustainable Transportation
                            [
                                "Teach kids about eco-friendly transportation options. Discuss the benefits of walking, biking, or using public transportation instead of relying on cars for short distances. Encourage them to take part in activities like walking or biking to school."
                            ],
                            // Page 8 - Volunteer and Community Involvement
                            [
                                "Engage children in community activities related to environmental conservation. Participate in beach cleanups, tree planting events, or local environmental initiatives."
                            ],
                            // Page 9 - Renewable Energy Sources
                            [
                                "Teach kids about renewable energy sources. Explore concepts like solar power, wind energy, and hydropower. Encourage them to imagine a world powered by clean and renewable energy."
                            ],
                            // Page 10 - Protecting Habitats
                            [
                                "Help kids understand the significance of protecting habitats and preserving biodiversity. Teach them about the importance of national parks, wildlife reserves, and marine sanctuaries."
                            ],
                            // Page 11 - Pollution Control
                            [
                                "Teach children about different types of pollution and their harmful effects on the environment and human health. Involve them in activities that promote pollution control."
                            ],
                            // Page 12 - Biodiversity Conservation
                            [
                                "Encourage kids to appreciate the incredible diversity of life on Earth. Discuss the impact of habitat loss, overfishing, and illegal wildlife trade on biodiversity."
                            ],
                            // Page 13 - Responsible Consumerism
                            [
                                "Teach kids about responsible consumerism and its impact on the environment. Discuss the importance of buying eco-friendly products and supporting local businesses."
                            ],
                            // Page 14 - Eco-Friendly Technologies
                            [
                                "Explain to kids how eco-friendly technologies are shaping a sustainable future. Introduce concepts like solar panels, wind turbines, and hydropower plants."
                            ],
                            // Page 15 - Protecting Nature and Wildlife
                            [
                                "Teach kids about the importance of protecting nature and wildlife. Discuss the roles of national parks, wildlife sanctuaries, and conservation efforts."
                            ]
                        ],
                        frameSize: [375, 375, 375, 375, 375],
                        lessonNumber: ["Lesson 1", "Lesson 2", "Lesson 3"],
                        lessonName: ["What is it about?", "What is it used for", "Why is it important"]
                    ).tag(0)
                } else {
                    childDiscoverUnactive().tag(1)
                }
                
                
            }
            .background((selectedTab == 0) ? Color("lightBlue") : Color("lightGray"))
            .tabViewStyle(PageTabViewStyle())
        }
        
        
        
    }
}

//struct childDiscoverScroll_Previews: PreviewProvider {
//    static var previews: some View {
//        childDiscoverScroll()
//    }
//}
