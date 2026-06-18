// AudioWorklet processor for real-time audio processing
// This replaces the deprecated ScriptProcessorNode
// Note: AudioWorklet processors must be in JavaScript as they run in a separate thread

class AudioProcessor extends AudioWorkletProcessor {
    constructor() {
        super();
        this.port.onmessage = (event) => {
            // Handle messages from main thread if needed
        };
    }

    process(inputs, outputs, parameters) {
        // Get input audio data
        const input = inputs[0];
        if (input && input.length > 0) {
            const inputChannel = input[0]; // Mono input
            
            // Send audio data to main thread for processing
            if (inputChannel && inputChannel.length > 0) {
                // Convert Float32Array to regular array for message passing
                const audioData = Array.from(inputChannel);
                this.port.postMessage({
                    type: 'audioData',
                    data: audioData
                });
            }
        }
        
        // Return true to keep processor alive
        return true;
    }
}

registerProcessor('audio-processor', AudioProcessor);
