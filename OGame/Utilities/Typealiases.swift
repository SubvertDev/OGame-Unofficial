//
//  Typealiases.swift
//  OGame
//
//  Created by Subvert on 13.07.2021.
//

import UIKit

// TODO: Change to structs?
typealias BuildingsData = [(name: String,
                            metal: Int,
                            crystal: Int,
                            deuterium: Int,
                            image: (available: UIImage?,
                                    unavailable: UIImage?,
                                    disabled: UIImage?),
                            buildingsID: Int,
                            level: Int,
                            condition: String)]

typealias ResearchesData = [(name: String,
                             metal: Int,
                             crystal: Int,
                             deuterium: Int,
                             image: (available: UIImage?,
                                     unavailable: UIImage?,
                                     disabled: UIImage?),
                             buildingsID: Int,
                             level: Int,
                             condition: String)]
//
typealias BuildingWithLevelsData = (name: String,
                          metal: Int,
                          crystal: Int,
                          deuterium: Int,
                          image: (available: UIImage?,
                                  unavailable: UIImage?,
                                  disabled: UIImage?),
                          buildingsID: Int,
                          level: Int,
                          condition: String)

typealias BuildingsWithLevelsData = [(name: String,
                          metal: Int,
                          crystal: Int,
                          deuterium: Int,
                          image: (available: UIImage?,
                                  unavailable: UIImage?,
                                  disabled: UIImage?),
                          buildingsID: Int,
                          level: Int,
                          condition: String)]
//

typealias ShipsData = [(name: String,
                        metal: Int,
                        crystal: Int,
                        deuterium: Int,
                        image: (available: UIImage?,
                                unavailable: UIImage?,
                                disabled: UIImage?),
                        buildingsID: Int,
                        amount: Int,
                        condition: String)]

typealias DefencesData = [(name: String,
                           metal: Int,
                           crystal: Int,
                           deuterium: Int,
                           image: (available: UIImage?,
                                   unavailable: UIImage?,
                                   disabled: UIImage?),
                           buildingsID: Int,
                           amount: Int,
                           condition: String)]

//
typealias BuildingWithAmountsData = (name: String,
                           metal: Int,
                           crystal: Int,
                           deuterium: Int,
                           image: (available: UIImage?,
                                   unavailable: UIImage?,
                                   disabled: UIImage?),
                           buildingsID: Int,
                           amount: Int,
                           condition: String)

typealias BuildingsWithAmountsData = [(name: String,
                           metal: Int,
                           crystal: Int,
                           deuterium: Int,
                           image: (available: UIImage?,
                                   unavailable: UIImage?,
                                   disabled: UIImage?),
                           buildingsID: Int,
                           amount: Int,
                           condition: String)]
//
