# the ID of your Google Cloud project.
export PROJECT_ID="ce-sap-latam-genai-demo" 

 #the ID of the Agentspace app.
export APP_ID="sap-abap-code_1764084452268"

# the ID of the reasoning engine endpoint where the ADK agent is deployed.
# The entire url, e.g.: projects/41865284455/locations/us-central1/reasoningEngines/6387168598867050496
export AGENT_ENGINE_RESOURCE="projects/935523525102/locations/us-central1/reasoningEngines/926417711238479872"

# the display name of the agent.
export DISPLAY_NAME="SAP ABAP Code Agent v2" 

#the description of the agent, displayed on the frontend; it is only for the user’s benefit.
export DESCRIPTION="SAP ABAP Code Agent in Google Cloud" 

# the description of the agent used by the LLM to route requests to the agent. 
# Must properly describe what the agent does. Never shown to the user.
export TOOL_DESCRIPTION="SAP ABAP Code Agent in Google Cloud"


curl -X POST \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H "Content-Type: application/json" \
-H "X-Goog-User-Project: $PROJECT_ID" \
"https://discoveryengine.googleapis.com/v1alpha/projects/$PROJECT_ID/locations/global/collections/default_collection/engines/$APP_ID/assistants/default_assistant/agents" \
-d '{ 
    "displayName": "'"$DISPLAY_NAME"'",
    "description": "'"$DESCRIPTION"'", 
    "adk_agent_definition": {
        "tool_settings": {
            "tool_description": "'"$TOOL_DESCRIPTION"'"
         },
        "provisioned_reasoning_engine": {
            "reasoning_engine": "'"$AGENT_ENGINE_RESOURCE"'"
        },
    } 
}'
