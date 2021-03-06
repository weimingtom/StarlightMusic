import QtQuick 2.12
import QtQuick.Particles 2.12

Item {
    id: root

    property alias running: particlesEmitter.enabled
    property alias source: particleImage.source
    property alias emitRate: particlesEmitter.emitRate

    onRunningChanged: {
        if (running) particleSystem.running = true;
        else {
            particleSystem.reset();
            particleSystem.running = false;
        }
    }

    ParticleSystem {
        id: particleSystem
        running: false

        Emitter {
            id: particlesEmitter
            enabled: false
            height: root.height
            width: root.width
            system: particleSystem
            size: 14
            sizeVariation: 8
            endSize: 0
            lifeSpan: 1300
            lifeSpanVariation: 800
            maximumEmitted: 400
            velocity: AngleDirection {
                angle: -90
                angleVariation: 40
                magnitude: 40
                magnitudeVariation: 40
            }
            acceleration: AngleDirection {
                angle: -90
                magnitude: 120
            }
        }

        ImageParticle {
            id: particleImage
            system: particleSystem
            alpha: 0.65
            alphaVariation: 0.25
            colorVariation: 0.6
        }
    }
}
